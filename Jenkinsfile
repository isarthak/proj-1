pipeline{
    agent any

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

       stage('Build Docker Image') {
            steps {
                // Build a Docker image using Docker-in-Docker
                sh 'mvn spring-boot:build-image'
            }
        }

//         stage('Pushing Image') {
//             environment {
//                 registryCredential = 'dockerhub-credentials'
//             }
//             steps{
//                 script {
//                     docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
//                         def customImage = docker.image(DOCKER_IMAGE_NAME)
//                         customImage.push()
//                     }
//                 }
//             }
//         }

    }
}