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
			sh 'mvn clean package -DskipsTests'
		 }
		}
		stage("Build Docker Image"){
			steps{
			sh 'docker build -t android-appium-aws/selenium-docker -f ./Dockerfile.txt .'
			sh 'docker images'
			}
		}

		stage("Run test"){
			steps{
			sh 'docker ps -a'
			}
		}
	}
	
	post{
		always{
			sh 'docker rmi -f android-appium-aws/selenium-docker'
			sh 'docker images'
		}
	}
}
