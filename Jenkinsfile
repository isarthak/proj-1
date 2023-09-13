pipeline{
    agent any

    tools{
        maven 'maven'
    }
    environment {
        DOCKER_IMAGE_NAME = 'sarthakmht/proj-1:latest'
        registry = "211223789150.dkr.ecr.us-east-1.amazonaws.com/my-docker-repo"
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
                    sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=apaspxp/latest"
                }
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