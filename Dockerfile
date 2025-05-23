# Use official OpenJDK base image (small + stable)

# Build Stage
FROM docker.io/library/maven:3.9.6-amazoncorretto-17 AS build
WORKDIR /Javaapp
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests


# Package Stage
FROM docker.io/library/amazoncorretto:17-alpine-jdk
WORKDIR Javaapp
COPY --from=build /Javaapp/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]


# Expose the app port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
  
