pipeline{
        agent any
        
        stages{
		stage(‘--build--‘){
			steps{
				sh ‘’'ssh deployment << EOF
				      export BUILD_NUMBER=${BUILD_NUMBER}
				      cd groupproj/qa-portal-services/
                                      git pull
				      mvn clean install -DskipTests
				      cd ..
				      docker-compose build
				      docker-compose push
                                      sed “s/{{BUILD}}/${BUILD_NUMBER}/g” ./compose.yaml
				      ‘’'
			}
		}
        }
}
