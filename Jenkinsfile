pipeline {
  agent any
  stages {
    stage('build docker image') {
      steps {
        script {
          def app = docker.build "onesync-test:v1"
        }

      }
    }

  }
}