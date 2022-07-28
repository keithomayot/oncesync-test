pipeline {
  
  environment {
       registry = "magalixcorp/k8scicd"
       GOCACHE = "/tmp"
  }

  agent {
    kubernetes {
      yaml '''
kind: Pod
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:debug
    imagePullPolicy: Always
    command:
    - sleep
    args:
    - 9999999
    volumeMounts:
      - name: jenkins-pv
        mountPath: /kaniko/.docker
  volumes:
  - name: jenkins-pv
    projected:
      sources:
      - secret:
          name: docker-credentials 
          items:
            - key: .dockerconfigjson
              path: config.json
'''
    }

  }
  stages {
    stage('build docker image with Kaniko') {
      steps {
        container(name: 'kaniko', shell: '/busybox/sh') {
          sh '''#!/busybox/sh
            /kaniko/executor --context `pwd` --destination keithomayot/oncesync:latest 
          '''
        }

      }
    }
  stage("Deploy to minikube with ansible"){
      steps{
          echo "====++++executing ++++===="
      }
      post{
          always{
              echo "====++++always++++===="
          }
          success{
              echo "====++++ executed successfully++++===="
          }
          failure{
              echo "====++++ execution failed++++===="
          }
  
      }
  }  

  }
}