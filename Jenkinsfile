pipeline {
          agent any
	  
	  stages{
	        stage('--clone repository--'){
			steps{
		                 sh '''cd ~
			               git clone “https://github.com/PCMBarber/groupproj
			               '''
                             }           
            	} 	
                stage('--Test--'){
                        steps{ 
		                 sh '''cd ~
			               cd groupproj/qa-portal-angular/ 
                                       sudo systemctl start postgresql.service
                                       sudo systemctl start mongodb 		
                                       mvn install -Dskiptest 
                                       '''
                             }  
                }                
		stage('--portal-core:latest--'){
                        steps{
                                 sh '''image="35.178.251.150:latest:8080/keycloak-${BUILD_NUMBER}"
                                       docker run -d -p 5000:5000 --restart=always --name registry registry:2
                                       docker-compose build -t ${image} /var/lib/jenkins/groupproj/qa-portal-angular
                                       docker compose push
				       docker stack deploy docker-compose.yaml
				       shh 35.177.167.1 << EOF
				       '''
                            }
                 } 
                stage('--cohort-api--'){
                        steps{
                                sh '''image="35.178.251.150:8086/core-api:build-${BUILD_NUMBER}"
                                      docker run -d -p 5000:5000 --restart=always --name registry registry:2
                                      docker build -t ${image} /var/lib/jenkins/groupproj/qa-portal-services/cohort-api
                                      docker push ${image}
                                      ssh 35.177.167.1  << EOF
                                      docker service update --image ${image} cohort-api
                                      '''
                            }
                }
                stage('--Test--'){
                       steps{ 
                                sh'''mvn clean install -Dskiptest 
                                     '''
                            }  
                }
                stage('--cv-api--'){
                       steps{ 
                                 sh '''image="35.178.251.150:8087/user-api:build-${BUILD_NUMBER}"
                                       docker run -d -p 5000:5000 --restart=always --name registry registry:2
                                       docker build -t ${image} /var/lib/jenkins/groupproj/qa-portal-services/cv-api
                                       docker push ${image}
                                       ssh 35.177.167.1  << EOF
                                       docker service update --image ${image} cv-api
                                       ''' 
                            } 
                }
                stage('--Test--'){
                        steps{ 
                                sh'''mvn clean install -Dskiptest 
                                     '''
                             }  
                }
                 stage('--self-reflection-api--'){
                        steps{ 
                                 sh '''image="35.178.251.150:8082/self-reflection:build-${BUILD_NUMBER}"
                                       docker run -d -p 5000:5000 --restart=always --name registry registry:2
                                       docker build -t ${image} /var/lib/jenkins/groupproj/qa-portal-services/self-reflection-api
                                       docker push ${image}
                                       ssh 35.177.167.1 << EOF
                                       docker service update --image ${image} self-reflection-api
                                       ''' 
                            } 
                }
                stage('--Test--'){
                        steps{ 
                                sh '''mvn clean install -Dskiptest 
                                      '''
                            }  
                }
                 stage('--portal-application-api--'){
                        steps{ 
                                 sh '''image="35.178.251.150:8081/cv-api:build-${BUILD_NUMBER}"
                                       docker run -d -p 5000:5000 --restart=always --name registry registry:2
                                       docker build -t ${image} /var/lib/jenkins/groupproj/qa-portal-services/portal-application-api
                                       docker push ${image}
                                       ssh 35.177.167.1 << EOF
                                       docker service update --image ${image} cv-api
                                       ''' 
                            } 
                }
                stage('--Test--'){
                        steps{ 
                                sh '''mvn clean install -Dskiptest 
                                      '''
                             }  
                }
                 stage('--feedback-api--'){
                        steps{ 
                                 sh '''image="35.178.251.150:8084/feedback-api:build-${BUILD_NUMBER}"
                                       docker run -d -p 5000:5000 --restart=always --name registry registry:2
                                       docker build -t ${image} /var/lib/jenkins/groupproj/qa-portal-services/feedback-api
                                       docker push ${image}
                                       ssh 35.177.167.1 << EOF
                                       docker service update --image ${image} feedback-api
                                       ''' 
                            } 
                }
                stage('--Test--'){
                       steps{ 
                                 sh '''mvn clean install -Dskiptest 
                                       '''   
                            }  
                }
                 stage('--form-api--'){
                        steps{ 
                                 sh '''image="35.178.251.150:8085/form-api:build-${BUILD_NUMBER}"
                                       docker run -d -p 5000:5000 --restart=always --name registry registry:2
                                       docker build -t ${image} /var/lib/jenkins/groupproj/qa-portal-services/form-api
                                       docker push ${image}
                                       ssh 35.177.167.1 << EOF
                                       docker service update --image ${image} form-api 
                                       ''' 
                             } 
                }
                stage('--Test--'){  
                stage('--Clean up--'){
                        steps{
                                 sh '''ssh 35.177.167.1 << EOF
                                       docker system prune -f
                                       '''
                            }
                  }
	 }
}
}
