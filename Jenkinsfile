pipeline {
    tools {
              maven '3.6.3'
              jdk 'jdk8'
              }
                stage("clone repository") {
		                    git "https://github.com/PCMBarber/groupproj"

            	}	
                stage('--Test--'){
                        steps{ 
                             mvn clean package --projects api-common,${PROJECT}
                        }  
                }
                stage('--portal-core:latest--'){
                        steps{
                                sh '''image=" ":8080/keycloak-${BUILD_NUMBER}"
                                      docker-compose build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-angular
                                      docker compose push
				      docker stack deploy docker-compose.yaml
				      '''
                        }
                }  
                stage('--Clean up--'){
                        steps{
                                sh '''ssh ##.##.##.##  << EOF
                                      docker system prune -f
                                      '''
                        }
                }
        }
}
