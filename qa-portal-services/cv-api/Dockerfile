FROM maven:3.6.1-jdk-8-slim as build
WORKDIR /build
COPY . .
RUN mvn clean package -DskipTests --projects ../api-common,cv-api
FROM openjdk:8-alpine
WORKDIR /opt/cv-api
COPY --from=build /build/cv-api/target/cv-api-*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["/usr/bin/java", "-Dspring.datasource.url=jdbc:postgresql://postgres:5432/qa-portal", "-jar", "./app.jar"]
