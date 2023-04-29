pipeline{
	agent any
	stages{
		stage("verify tooling"){
		 steps{
			sh '''
			docker -v
			mvn -v
			java -version
			'''
		 }
		}
		stage("Compile Code"){
		 steps{
			sh 'whoami'
			//sh 'mvn clean package -DskipsTests'
		 }
		}
		stage("Build Docker Image"){
			steps{
			sh 'chmod 770 *' 
			sh 'docker build -t android-appium-aws/selenium-docker -f ./Dockerfile.txt .'
			}
		}
		
		stage("Start container"){
			steps{
				
			//sh 'docker stop mydemo'
			//sh 'docker rm -f mydemo' 
			sh 'docker run -d -i --name mydemo --entrypoint=/bin/sh android-appium-aws/selenium-docker'
			 
			}
		}
		stage("Run test"){
			steps{
				
			//sh 'docker exec -e "TERM=xterm" -i mydemo sh' 
			
			//docker exec -i mydemo sh
			sh 'pwd'
			sh 'ls -ll'
			//cd target
			//ls -ll
			//java -cp selenium-test.jar:selenium-test-tests.jar:libs/* org.testng.TestNG testng.xml
			
			
			}
		}
	}
	
	post{
		always{
		 	sh 'docker ps -a'
			//sh 'docker-compose down'
		 
		}
	}
}
