pipeline {
  agent {
    docker {
      image 'docker'
      args '--privileged -u root'
    }

  }
  stages {
    stage('build docker image') {
      steps {
        sh 'docker build -t onesync-test:v1 .'
      }
    }

  }
}