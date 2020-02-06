pipeline {
          agent any
	  
	  stages{
                stage('--Test1--'){
                        steps{ 
		                 sh '''cd ~/
			               cd groupproj/qa-portal-services/ 		
                                       mvn clean install -DskipTests 
                                       '''
                             }  
                }                
		stage('--portal-core:latest--'){
                        steps{
                                 sh '''image="35.178.251.150:latest:8080/keycloak-${BUILD_NUMBER}"
                                       docker run -d -p 5000:5000 --restart=always --name registry registry:2
                                       docker-compose build 
                                       docker compose push
				       ssh 35.177.167.1 << EOF
				       docker stack deploy --compose-file=docker-compose.yaml
				       '''
                            }
                 } 
                stage('--Clean up--'){
                        steps{
                                 sh '''ssh 35.177.167.1 << EOF
                                       docker system prune -f
                                       '''
                            }
                  }
	 }
}
