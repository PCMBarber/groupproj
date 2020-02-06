FROM openjdk:8-alpine
ARG PROJECT
WORKDIR /opt/${PROJECT}
COPY ./${PROJECT}/target/${PROJECT}-*.jar app.jar
ENTRYPOINT ["/usr/bin/java", "-Dspring.datasource.url=jdbc:postgresql://postgres_db:5432/qa-portal", "-jar", "./app.jar"]
