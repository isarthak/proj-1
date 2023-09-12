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
               dockerfile {
                   filename 'Dockerfile' // Specify your Dockerfile path here
                   label 'docker' // Label for the Docker agent
                   reuseNode true // Reuse the Docker agent for multiple stages
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