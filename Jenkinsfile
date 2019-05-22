
pipeline {
    agent any
    

    stages {
        stage('Checkout') {
            steps{
                checkout scm
            }
        }
        stage('Build') {
            steps{
                script {         
                    docker.withRegistry('', 'docker-hub-id'){           
                        appimage = docker.build("yogendra/test-web:latest")
                        appimage.push()                
                    }
                }
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
