# Use the official OpenJDK 8 base image from Docker Hub
FROM openjdk:8-jre-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy your Java application JAR file into the container
COPY proj-1-0.0.1-SNAPSHOT.jar app.jar

# Specify the default command to run your Java application
CMD ["java", "-jar", "app.jar"]
