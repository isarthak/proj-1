pipeline{
    agent none
    tools{
        maven 'maven'
    }
    environment {
        DOCKER_IMAGE_NAME = 'sarthakmht/proj-1'
    }
    stages{
        stage('Code Quality'){
            agent any
            steps{
                sh "echo Sonarqube code quality done"
            }
        }

        stage('Build Image'){
            steps{
                script {
                    def imageTag = "proj-1:${timestamp}"
                    sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=sarthakmht/${imageTag}"
                }
            }
        }

        stage('Pushing Image') {
            environment {
                registryCredential = 'dockerhub-credentials'
            }
            steps{
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                        def customImage = docker.image(DOCKER_IMAGE_NAME)
                        customImage.push()
                    }
                }
            }
        }

    }
}