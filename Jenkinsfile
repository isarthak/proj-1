pipeline{
    agent none
    tools{
        maven 'maven'
    }
    stages{
        stage('Code Quality'){
            agent any
            steps{
                sh "echo Sonarqube code quality done"
            }
        }

        stage('Build Image'){
            agent any
            steps{
               sh "mvn spring-boot:build-image -Dspring-boot.build-image.imageName=sarthak/latest"
            }
        }

    }
}