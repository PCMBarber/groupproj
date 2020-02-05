FROM maven:3.6.1-jdk-8-slim as build
WORKDIR /build
COPY . .
RUN mvn clean package -DskipTests --projects ../api-common,feedback-api
FROM openjdk:8-alpine
WORKDIR /opt/feedback-api
COPY --from=build /build/feedback-api/target/feedback-api-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["/usr/bin/java", "-Dspring.datasource.url=jdbc:postgresql://postgres:5432/qa-portal", "-jar", "./app.jar"]
