pipeline{
  agent {label "docker"}
  
  stages {
    
    stage('preparation'){
      steps {
        git 'https://github.com/ZiadAmr14/Booster_CI_CD_Project.git'
      }
    
    }
    
    
     stage('build image'){
      steps {
          sh 'docker build . -f Dockerfile -t ziadamr14/sprints_django_app:latest'
        }
     }
    
    
     stage('push image'){
            steps {
                withCredentials([usernamePassword(credentialsId:"dockerhub",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]) {
                    
                    sh """
                      docker login -u ${USERNAME} -p ${PASSWORD}
                      docker push ziadamr14/sprints_django_app:latest
                    """
                }
            }
        }
     stage('deploy'){
            steps {
                sh 'docker run -d -p 8000:8000 ziadamr14/sprints_django_app:latest'
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
