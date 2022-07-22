pipeline {
  agent any
  stages {
    stage('build docker image') {
      steps {
        script {
          app = docker.build "onesync-test:v1 "
        }

      }
    }

  }
}