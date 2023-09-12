pipeline {

  environment {
    DOCKER_HUB_USERNAME = credentials('docker-hub-username')
    DOCKER_HUB_PASSWORD = credentials('docker-hub-password')
    DOCKER_IMAGE_NAME  = 'sarthakmht/proj-1:latest'
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/isarthak/proj-1'
      }
    }

    stage('Build image') {
      steps{
        script {
          sh './mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=${DOCKER_IMAGE_NAME}'
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

