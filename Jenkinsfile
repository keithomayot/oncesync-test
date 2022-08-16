pipeline {
  
  environment {
       registry = "keithomayot/oncesync"
  }

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
  stage("Deploy to localhost with ansible"){
    environment{
      def image_id = "${registry}" + ":latest";
      }
      agent any    
      steps{
          echo"This is the ${BUILD_NUMBER} th build";
          // sh ''' 
          //    ansible-playbook /deployplaybook.yaml -e image_id='${image_id}'
          //    '''
          ansiblePlaybook(playbook: '/deployplaybook.yaml', 
                          extraVars: [image_id: '${image_id}'],
                          colorized: true,
                          installation: 'ansible')
      }
      post{
          always{
              echo "Step has been run"
          }
          success{
              echo "Playbook run successfully"
          }
          failure{
              echo "Could not run playbook"
          }
  
      }
  }  

  }
}