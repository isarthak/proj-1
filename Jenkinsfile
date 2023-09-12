pipeline {

  environment {
    dockerimagename = "sarthakmht/proj-1:latest"
    dockerImage = ""
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
          echo("building image")
          sh './sudo mvnw spring-boot:build-image -Dspring-boot.build-image.imageName=${dockerimagename}'
        }
      }
    }

    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhub-credentials'
           }
      steps{
        script {
          echo("pushing image")
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Deploying Spring Boot container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "proj-1-deployment")
        }
      }
    }

  }

}

