FROM maven:3.8.1-openjdk-11-slim
WORKDIR /app
#COPY pom.xml .
#RUN ["mvn","verify","clean","--fail-never"]
COPY . .
#RUN mvn package
 
