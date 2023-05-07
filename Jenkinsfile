node{
	agent any
	environment {
        	N = "android/aws"
    	}
	stages{
		stage('Connect to EC2 Server'){

		def cmd = 'ls -ll'
		sshagent(['qa-server']){
			sh "ssh -o StrictHostKeyChecking=no ubuntu@3.231.156.49 ${cmd}"
		}
		}	
				
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
			//sh "docker build . -t '${N}'"
			sh 'docker images'
		 }
		}

		stage("Run test from Docker"){
		 steps{
			sh 'ls -ll'
			//sh "docker run -i --entrypoint=sh '${N}'"
			//sh ' sh run.sh' 
		 }
		}
	}
	
	post{
		always{
			//sh "docker rmi -f '${N}'"
			sh 'docker images'
			sh 'docker ps -a'
		}
	}
}
