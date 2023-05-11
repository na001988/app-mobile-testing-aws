pipeline {
	agent any
	environment {
		N = "android/aws"
		IP = "ec2-54-84-107-61.compute-1.amazonaws.com"
	}
	stages {

		stage('Connect to EC2 on AWS') {
			steps {
				sshagent(['amazon-linux']) {
					sh "ssh -o StrictHostKeyChecking=no -l ec2-user ${IP}"
				}
			}
		}

		stage("verify tooling") {
			steps {
				sh '''
				docker -v
				mvn -v
				java -version 
				'''
			}
		}
		stage("Compile Code") {
			steps {
				echo 'mvn clean install -DskipTests -U'
				//sh 'mvn clean install -DskipTests -U'
			}
		}
		stage("Build Docker Image") {
			steps {
				sh "docker build . -t '${N}'"
				sh 'docker images'
			}
		}

		stage("Run test from Docker") {
			steps {
				//sh 'ls -ll'
				sh "docker run -i --entrypoint=sh '${N}'"
				sh 'sh run.sh' 
			}
		}
	}

	post {
		always {
			//sh "docker rmi -f '${N}'"
			sh 'docker images'
			sh 'docker ps -a'
		}
	}
}
