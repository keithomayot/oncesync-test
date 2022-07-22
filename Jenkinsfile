pipeline {
  agent any
  stages {
    stage('build docker image') {
      steps {
        sh 'def app = docker.build "onesync-test:v1 "'
      }
    }

  }
}