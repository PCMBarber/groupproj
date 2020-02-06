pipeline {
          agent any
	  
	  stages{
                stage('--Test1--'){
                        steps{ 
		                 sh '''cd qa-portal-services/ 		
                                       mvn clean install -DskipTests
				       cd ..
                                       docker-compose build 
                                       docker-compose push
				       ssh 18.130.195.35 << EOF
				       docker stack deploy --compose-file=docker-compose.yaml
				       '''
                            }
                 } 
                stage('--Clean up--'){
                        steps{
                                 sh '''ssh 18.130.195.35 << EOF
                                       docker system prune -f
                                       '''
                            }
                  }
	 }
}
