# Use official OpenJDK base image (small + stable)

# Build Stage
FROM maven:3.8.7-openjdk-17 AS build
WORKDIR /Javaapp
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Package Stage
FROM openjdk:17-jdk-slim
WORKDIR Javaapp
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]


# Expose the app port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
  
