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
            environment {
                registryCredential = 'docker-hub-credentials'
            }
            steps{
                script {

                     def dockerHubUsername = credentials('docker-hub-username')
                     def dockerHubPassword = credentials('docker-hub-password')

                     sh "docker login -u ${dockerHubUsername} -p ${dockerHubPassword}"

                }
            }
        }

    }
}
