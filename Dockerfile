# Stage 1: Build the application using Maven and Java 23
FROM maven:3-eclipse-temurin-23 AS build
RUN mvn clean package -DskipTests

# Stage 2: Run the application using Java 23
FROM eclipse-temurin:23-jdk
COPY --from=build /app/target/KnapsackHeist-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
