# Stage 1: Build the application
FROM maven:3-eclipse-temurin-23 AS build
WORKDIR /app
COPY pom.xml ./
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Deploy on Tomcat
FROM tomcat:10.1-jdk23-temurin
WORKDIR /usr/local/tomcat/webapps/
COPY --from=build /app/target/*.war ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
