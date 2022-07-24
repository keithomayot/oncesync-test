pipeline {
  agent any
  stages {
    stage('Build docker image') {
      steps {
        script {
          def app = docker.build'onesync-test:v1'
        }

      }
    }

  }
}