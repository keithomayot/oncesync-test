<<<<<<< HEAD
pipeline {
    agent {
    kubernetes {
      yaml """
kind: Pod
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    imagePullPolicy: IfnotPresent
    command:
    - sleep
    args:
    - 9999999
#    volumeMounts:
#      - name: jenkins-docker-cfg
#        mountPath: /kaniko/.docker
#  volumes:
#  - name: jenkins-docker-cfg
#    projected:
#      sources:
#      - secret:
#          name: docker-credentials 
#          items:
#            - key: .dockerconfigjson
#              path: config.json
"""
    }
  }
  stages {
    stage('build docker image with Kaniko') {
      steps {
        container(name: 'kaniko', shell: '/busybox/sh') {
          sh '''#!/busybox/sh
            /kaniko/executor --context `pwd` --destination oncesync-test:latest 
          '''
        }
      }
    }

  }
=======
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
>>>>>>> ff0881769c291ac3b630d97da08b390ea14f1bb1
}