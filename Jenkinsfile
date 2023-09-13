pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('Code Quality'){
            agent any
            steps{
                sh "echo Sonarqube code quality done"
            }
        }
        stage('Docker Image') {
            steps{
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                        def timestamp = new Date().format("yyyyMMdd_HHmmss")
                        def imageTag = "proj-1:${timestamp}"
                        sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=sarthakmht/${imageTag}"
                        sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                        sh "docker push sarthakmht/${imageTag}"
                        sh "docker tag sarthakmht/${imageTag} sarthakmht/proj-1:latest"
                        sh "docker push sarthakmht/proj-1:latest"
                   }
                }
            }
        }
        stage('Kubernetes'){
            steps{
                sh "echo Kubernetes task end"
            }
        }
    }
}
