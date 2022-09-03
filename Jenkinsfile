pipeline {
  agent any
  stages {
    stage('build docker image with Kaniko') {
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
      steps {
        container(name: 'kaniko', shell: '/busybox/sh') {
          sh '''#!/busybox/sh
            /kaniko/executor --context `pwd` --destination keithomayot/oncesync:latest 
          '''
        }

      }
    }

    stage('Deploy to localhost with ansible') {
      agent any
      environment {
        image_id = '${registry}:latest'
      }
      post {
        always {
          echo 'Step has been run'
        }

        success {
          echo 'Playbook run successfully'
        }

        failure {
          echo 'Could not run playbook'
        }

      }
      steps {
        echo "This is the ${BUILD_NUMBER} th build"
        ansiblePlaybook(playbook: '/deployplaybook.yaml', extraVars: [image_id: '${image_id}'], colorized: true, installation: 'ansible')
      }
    }

  }
  environment {
    registry = 'keithomayot/oncesync'
  }
}