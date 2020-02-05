FROM maven:3.6.1-jdk-8-slim as build
ARG PROJECT
WORKDIR /build
COPY . .
RUN mvn clean package -DskipTests --projects api-common,${PROJECT}
FROM openjdk:8-alpine
ARG PROJECT
WORKDIR /opt/${PROJECT}
COPY --from=build /build/${PROJECT}/target/${PROJECT}-*.jar app.jar
ENTRYPOINT ["/usr/bin/java", "-Dspring.datasource.url=jdbc:postgresql://postgres_db:5432/qa-portal", "-jar", "./app.jar"]
