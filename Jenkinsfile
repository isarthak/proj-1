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
            agent {
               docker {
                   image 'docker:20.10' // Use a Docker image that includes Docker
                   args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount the Docker socket
               }
             }
            steps {
                // Build a Docker image using Docker-in-Docker
                sh 'docker build -t ${DOCKER_IMAGE_NAME} .'
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