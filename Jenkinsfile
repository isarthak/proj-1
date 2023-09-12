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
           environment {
                registryCredential = 'dockerhub-credentials'
            }
            steps {
                script {
                    docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
                        // Generate a timestamp or version number for the image tag
                        def timestamp = new Date().format("yyyyMMdd_HHmmss")
                        def imageTag = "jenkins-demo:${timestamp}"

                        // Build the Docker image using the spring-boot:build-image Maven goal
                        sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=apaspxp/${imageTag}"
//                         sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=apaspxp/jenkins-demo:latest"

//                         // Log in to Docker Hub using the credentials
//                         sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
// //                         sh "echo $DOCKERHUB_PASSWORD | docker login --username $DOCKERHUB_USERNAME --password-stdin"
//
//                         // Push the Docker image to a registry
//                         sh "docker push apaspxp/${imageTag}"
// //                         sh "docker push apaspxp/jenkins-demo:latest"
//
//                         // Tag the image as "latest"
//                         sh "docker tag apaspxp/${imageTag} apaspxp/jenkins-demo:latest"
//                         sh "docker push apaspxp/jenkins-demo:latest"

                        // Print the image tag for reference
                        echo "Docker image tag: ${imageTag}"
                    }
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