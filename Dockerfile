# Use official OpenJDK base image (small + stable)
FROM openjdk:17-jdk-slim

# Set working directory inside the container
WORKDIR /app

# Copy built JAR file (assumes you’ve built it with Maven/Gradle beforehand)
COPY target/*.jar app.jar

# Expose the app port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
  
