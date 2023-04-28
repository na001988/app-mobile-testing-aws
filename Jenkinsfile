pipeline{
	agent any
	stages{
		stage("verify tooling"){
		 steps{
			sh '''
			docker info
			mvn -v
			java -version
			'''
		 }
		}
		stage("Compile Code"){
		 steps{
			sh 'mvn clean package -DskipsTests'
		 }
		}
		stage("Build Docker Image"){
			steps{
			 sh 'docker build -t android-appium-aws/selenium-docker -f ./Dockerfile.txt .'
			}
		}
		
		stage("Start container"){
			steps{
			 sh 'docker run -it --entrypoint=/bin/sh android-appium-aws/selenium-docker'
			 sh 'docker ps -a'
			}
		}
		stage("Run test"){
			steps{
			 sh 'java -cp selenium-test.jar:selenium-test-tests.jar:libs/* org.testng.TestNG testng.xml'
			}
		}
	}
	
	post{
		always{
		 sh 'docker compose down'
		}
	}
}
