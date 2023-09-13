pipeline{
    agent any

    tools{
        maven 'maven'
    }
    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        DOCKER_IMAGE_NAME = 'sarthakmht/proj-1'
    }
    stages{
        stage('Code Quality'){
            agent any
            steps{
                sh "echo Sonarqube code quality done"
            }
        }

        stage('Find Relative Path to Dockerfile') {
            steps {
                script {
                    def currentWorkspace = pwd()
                    def dockerfilePath = findDockerfile(currentWorkspace)
                    echo "Relative path to Dockerfile: ${dockerfilePath}"
                }
            }
        }

       stage('Build Docker Image') {
            steps {
                script {
                    docker.build("-t ${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER} -f Dockerfile .")
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

def findDockerfile(currentWorkspace) {
    def dockerfilePath = null
    def dockerfileNames = ['Dockerfile', 'Dockerfile.dev', 'Dockerfile.prod'] // Add more possible Dockerfile names if needed

    for (def name : dockerfileNames) {
        def dockerfile = currentWorkspace + "/" + name
        if (fileExists(dockerfile)) {
            dockerfilePath = name
            break
        }
    }

    if (dockerfilePath == null) {
        error("No Dockerfile found in the workspace.")
    }

    return dockerfilePath
}