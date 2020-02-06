pipeline {
          agent any
	  
	  stages{
	            stage('--clone repository--'){
			          steps{
		                         sh '''cd ~
			                       git clone “https://github.com/PCMBarber/groupproj
			     }                 '''
            	}	
                    stage('--Test--'){
                                  steps{ 
		                	 sh '''cd ~
			                       cd groupproj/qa-portal-angular/ 		
                                               mvn clean install -Dskiptest
				               '''
                             }  
                }
                    stage('--portal-core:latest--'){
                         	  steps{
                                	 sh '''image=portal-core:latest:8080/keycloak-${BUILD_NUMBER}"
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
	
