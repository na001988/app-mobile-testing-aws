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
			//sh 'docker build . -t android-appium-aws/selenium-docker'
			sh 'docker images'
			}
		}

		stage("Run test from Docker"){
			steps{
			sh '''
				docker run -i --entrypoint=sh android-appium-aws/selenium-docker'
				sh run.sh &
				exit
			  '''
			//sh 'docker exec -i android-appium-aws/selenium-docker /bin/sh  run.sh'
			
			}
		}
	}
	
	post{
		always{
			//sh 'docker rmi -f android-appium-aws/selenium-docker'
			sh 'docker images'
		}
	}
}
