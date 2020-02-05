node {
    tools {
              maven '3.6.3'
              jdk 'jdk8'
              }
                stage("clone repository") {
		                    git "https://github.com/"

            	}	
                stage('--Test--'){
                        steps{ 
                             mvn clean package --projects api-common,${PROJECT}
                        }  
                }
                stage('--portal-core:latest--'){
                        steps{
                                sh '''image="########:8080/keycloak:build-${BUILD_NUMBER}"
                                      docker-compose up -d --build -t ${image} /var/lib/jenkins/QA-Portal/qa-portal-angular
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
