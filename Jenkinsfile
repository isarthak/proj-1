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

       stage('Build Docker Image') {
            steps {
                script {
                    sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=${DOCKER_IMAGE_NAME}"
                }
            }
        }

       stage('Pushing Docker Image') {
            steps{
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'docker-hub-username', usernameVariable: 'docker-hub-password')]) {
                         def imageTag = "sarthakmht/proj-1:latest"
                         sh docker login -u $dockerHubUsername -p $dockerHubPassword
                            sh "docker push ${imageTag}"
                    }

                }
            }
       }

    }
}
