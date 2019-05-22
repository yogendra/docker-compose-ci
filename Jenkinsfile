node {
  withDockerServer([credentialsId: "ds-manager1", uri: "tcp://35.222.233.121:2376"]) { 
    sh "printenv" 
    sh "docker images" 
    sh "docker-compose help"
  }
}
