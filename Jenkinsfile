pipeline {
    tools {
              maven '3.6.3'
              jdk 'jdk8'
              }
                stage("clone repository") {
		                    git clone "https://github.com/PCMBarber/groupproj"
			            cd groupproj/qa-portal-angular/

            	}	
                stage('--Test--'){
                        steps{ 
				
                             mvn clean install - Dskiptest
                        }  
                }
                stage('--portal-core:latest--'){
                        steps{
                                sh '''image=" ":8080/keycloak-${BUILD_NUMBER}"
                                      docker-compose build -t ${image} /var/lib/jenkins/groupproj/qa-portal-angular
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
