FROM maven:3.6.1-jdk-8-slim as build
WORKDIR /build
COPY . .
RUN mvn clean package --projects ../api-common,portal-application-api
FROM openjdk:8-alpine
WORKDIR /opt/portal-application-api
COPY --from=build /build/portal-application-api/target/portal-application-api-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["/usr/bin/java", "-Dspring.datasource.url=jdbc:postgresql://postgres:5432/qa-portal", "-jar", "./app.jar"]
