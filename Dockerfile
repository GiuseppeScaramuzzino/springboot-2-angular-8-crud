FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD

MAINTAINER Giuseppe Scaramuzzino

COPY pom.xml /build/
COPY src /build/src/

WORKDIR /build/
RUN  mvn clean package

FROM openjdk:8-jre-alpine

WORKDIR /app

COPY --from=MAVEN_BUILD /build/target/springboot-2-angular-8-crud-0.0.1-SNAPSHOT.jar /app/

ENTRYPOINT ["java", "-jar", "springboot-2-angular-8-crud-0.0.1-SNAPSHOT.jar"]
