pipeline {
	agent any
	environment {
		N = "android/aws"
		IP = "3.236.199.81"
	}
	stages {

		stage('Connect to EC2 on AWS') {
			steps {
				sshagent(['qa-server']) {
					sh "ssh -o StrictHostKeyChecking=no -l ubuntu ${IP}"
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
				sh 'mvn clean install -DskipTests -U'
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
			sh "docker rmi -f '${N}'"
			sh 'docker images'
			sh 'docker ps -a'
		}
	}
}
