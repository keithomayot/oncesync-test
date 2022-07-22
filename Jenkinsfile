pipeline {
  agent any
  stages {
    stage('Build docker image') {
      steps {
        sh 'Docker build -t oncesync-test:latest .'
      }
    }

  }
}