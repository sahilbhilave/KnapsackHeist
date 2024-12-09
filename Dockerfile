# Use a base image that has Java installed
FROM eclipse-temurin:23-jdk AS base

COPY . .
RUN ./mvnw clean package -DskipTests
# Copy the JAR file to the root of the container
COPY /target/KnapsackHeist-0.0.1-SNAPSHOT.jar app.jar

# Expose the application port
EXPOSE 8080

# Set the entry point to run the JAR file
ENTRYPOINT ["java", "-jar", "/app.jar"]
