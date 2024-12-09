# Stage 1: Build the application
FROM maven:3-eclipse-temurin-23 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Stage 2: Create a lightweight runtime image
FROM eclipse-temurin:23-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]
