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
        stage('Docker Image') {
            steps{
                script {
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]) {
                       def timestamp = new Date().format("yyyyMMdd_HHmmss")
                       def imageTag = "proj-1:${timestamp}"
                       sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=$DOCKERHUB_USERNAME/${imageTag}"
                       sh "docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD"
                       sh "docker push $DOCKERHUB_USERNAME/${imageTag}"
                       sh "docker tag $DOCKERHUB_USERNAME/${imageTag} $DOCKERHUB_USERNAME/proj-1:latest"
                       sh "docker push $DOCKERHUB_USERNAME/proj-1:latest"
                   }
                }
            }
        }
    }
}
