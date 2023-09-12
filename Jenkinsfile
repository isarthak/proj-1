pipeline {

  environment {
    dockerimagename = "sarthakmht/proj-1:latest"
    dockerImage = ""
  }

  agent any

  stages {

try{
    stage('Checkout Source') {
      steps {
        git 'https://github.com/isarthak/proj-1'
      }
    }


    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

}
catch(e){
    currentBuild.result = "FAILED"
    echo(e)
    throw e
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

    stage('Deploying React.js container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "proj-1-deployment.yaml")
        }
      }
    }

  }

}