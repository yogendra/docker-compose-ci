
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
                        appimage = docker.build("yogendra/test-web:1.0.${env.BUILD_ID}")
                        appimage.push()
                        appimage.push("latest")
                    }
                }
            }
        }
        stage('Deploy') {            
            steps {
                withDockerServer([credentialsId: "ds-manager1", uri: "tcp://35.222.233.121:2376"]) {                         
                    sh 'docker-compose pull web'
                    sh "docker-compose -p dctest up -d --build  --force-recreate"
                }
            }
        }
    }
}
