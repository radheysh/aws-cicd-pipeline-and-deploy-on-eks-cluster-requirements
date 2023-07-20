# Start with a base image containing Java runtime (mine java 8)
#FROM openjdk:8u212-jdk-slim
#FROM openjdk:8u232-jdk
FROM 993707650522.dkr.ecr.eu-central-1.amazonaws.com/java-openjdk:8u232-jdk
# Add Maintainer Info
LABEL maintainer="anup@blockgemin.com"
# Add a volume pointing to /tmp
VOLUME /tmp
# Make port 9091 available to the world outside this container
EXPOSE 9091
# The application's jar file (when packaged)
ARG JAR_FILE=target/price-manager-integration-0.0.1-SNAPSHOT.jar
# Add the application's jar to the container
ADD ${JAR_FILE} price-manager-integration-0.0.1-SNAPSHOT.jar
# Run the jar file 
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/price-manager-integration-0.0.1-SNAPSHOT.jar"]