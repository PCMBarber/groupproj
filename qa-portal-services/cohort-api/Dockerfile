FROM maven:3.6.1-jdk-8-slim as build
WORKDIR /build
COPY . .
RUN mvn clean package --projects ../api-common,cohort-api
FROM openjdk:8-alpine
WORKDIR /opt/cohort-api
COPY --from=build /build/cohort-api/target/cohort-api-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["/usr/bin/java", "-Dspring.datasource.url=jdbc:postgresql://postgres:5432/qa-portal", "-jar", "./app.jar"]
