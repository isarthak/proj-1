pipeline{
    agent any
    tools{
        maven 'maven'
    }
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE_NAME = 'sarthakmht/proj-1:latest'
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
                       docker push sarthakmht/proj-1:latest
                   }
                }
            }
        }
    }
}
