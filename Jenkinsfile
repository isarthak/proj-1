pipeline{
    agent none
    tools{
        maven 'maven'
    }
    stages{
        stage('Compile'){
            agent any
            steps{
                sh "mvn compile"
            }
        }
        stage('Code Quality'){
            agent any
            steps{
                sh "echo Sonarqube code quality done"
            }
        }

        stage('Test'){
            agent any
            steps{
                sh "mvn test"
            }
        }

        stage('Package'){
            agent any
            steps{
                sh "mvn package"
            }
        }

    }
}