pipeline {

  environment {
    dockerimagename = "sarthakmht/proj-1:latest"
    dockerImage = ""
  }

  agent any

  stages {

//     stage('Checkout Source') {
//       steps {
//         git 'https://github.com/isarthak/proj-1'
//       }
//     }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build("springboot-deploy:$dockerimagename")
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

