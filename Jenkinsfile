pipeline{
	agent any
	environment {
        	N = "android/aws"
    	}
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
			//sh "docker build . -t '${N}'"
			sh 'docker images'
		 }
		}

		stage("Run test from Docker"){
		 steps{
			//sh 'docker ps'
			//sh '''
			sh "docker run -i --entrypoint=sh '${N}'"
			sh ' sh run.sh' 
		  	//'''
		 }
		}
	}
	
	post{
		always{
			//sh 'docker rmi -f ${name}'
			sh 'docker images'
		}
	}
}
