pipeline{
    agent none
    tools{
        maven 'maven'
    }
    environment {
        DOCKER_IMAGE_NAME = 'sarthakmht/proj-1:latest'
    }
    stages{
        stage('Code Quality'){
            agent any
            steps{
                sh "echo Sonarqube code quality done"
            }
        }

        stage('Build Image'){
            agent any
            steps{
               sh "mvn spring-boot:build-image"
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