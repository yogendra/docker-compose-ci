pipeline {
    agent any
    
    checkout scm 
    stages {
        stage('Build') {
            steps{
                docker
                    .build("yogendra/test-web:latest")
                    .push()
            }

        }
        stage('Deploy') {
            
            steps {
                withDockerServer([credentialsId: "ds-manager1", uri: "tcp://35.222.233.121:2376"]) {                         
                    sh "docker-compose -p dctest up -d --force-recreate"
                }
            }
        }
    }
}
