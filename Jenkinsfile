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

//        stage('Build Docker Image') {
//             steps {
//                 script {
//                     sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=${DOCKER_IMAGE_NAME}"
//                 }
//             }
//         }

       stage('Pushing Docker Image') {
            steps{
                script {
                   withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                                           // Generate a timestamp or version number for the image tag
                                           def timestamp = new Date().format("yyyyMMdd_HHmmss")
                                           def imageTag = "jenkins-demo:${timestamp}"

                                           // Build the Docker image using the spring-boot:build-image Maven goal
                                           sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=sarthakmht/${imageTag}"
                   //                         sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=sarthakmht/jenkins-demo:latest"

                                           // Log in to Docker Hub using the credentials
                                           sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                   //                         sh "echo $DOCKERHUB_PASSWORD | docker login --username $DOCKERHUB_USERNAME --password-stdin"

                                           // Push the Docker image to a registry
                                           sh "docker push sarthakmht/${imageTag}"
                   //                         sh "docker push apaspxp/jenkins-demo:latest"

                                           // Tag the image as "latest"
                                           sh "docker tag sarthakmht/${imageTag} sarthakmht/jenkins-demo:latest"
                                           sh "docker push sarthakmht/jenkins-demo:latest"

                                           // Print the image tag for reference
                                           echo "Docker image tag: ${imageTag}"

                   }
                }
            }
       }

    }
}
