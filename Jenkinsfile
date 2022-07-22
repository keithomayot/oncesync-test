pipeline {
  agent any
  stages {
    stage('Install docker driver') {
      steps {
        sh '''curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce'''
      }
    }

    stage('Start docker') {
      steps {
        sh 'sudo service docker start'
        sh 'sudo service docker status'
      }
    }

    stage('Build docker image') {
      steps {
        script {
          def app = docker.build'onesync-test:v1'
        }

      }
    }

  }
}