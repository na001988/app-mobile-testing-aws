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
			//sh 'whoami'
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
			sh 'docker run -d -i --name mydemo --entrypoint=/bin/sh android-appium-aws/selenium-docker'
			}
		}
		stage("Run test"){
			steps{
			sh 'docker exec -i mydemo /bin/sh  run_app.sh'
			}
		}
	}
	
	post{
		always{
		 	sh 'docker stop mydemo'
			sh 'docker rmi -f android-appium-aws/selenium-docker'
			sh 'docker ps'
		}
	}
}
