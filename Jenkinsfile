pipeline {
    agent any
    
    stages {
        stage ('Checkout'){
               checkout scm 
        }
        stage('Build') {
            docker
                .build("yogendra/test-web:latest")
                .push()

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
