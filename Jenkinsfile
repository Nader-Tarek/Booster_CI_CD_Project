pipeline{
  agent {label "slave-node"}
  
  stages {
    
    stage('preparation'){
      steps {
        git 'https://github.com/Nader-Tarek/Booster_CI_CD_Project'
      } 
    }
    
     stage('build image'){
      steps {
          sh 'docker build . -f Dockerfile -t nadertarekcs/sprints_django_app:latest'
        }
     }
    
    
     stage('push image'){
            steps {
                withCredentials([usernamePassword(credentialsId:"DockerHub",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]) {
                    
                    sh """
                      docker login -u ${USERNAME} -p ${PASSWORD}
                      docker push nadertarekcs/sprints_django_app:latest
                    """
                }
            }
        }
     stage('deploy'){
            steps {
                sh 'docker run -d -p 8000:8000 nadertarekcs/sprints_django_app:latest'
            }
           post {
              success {
                slackSend (color: '#00FF00', message: "SUCCESSFUL")
             }

              failure {
                slackSend (color: '#FF0000', message: "FAILED")
               
             }
    }
        }

    }

  }
