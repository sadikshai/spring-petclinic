FROM maven:3.9.7-eclipse-temurin-17 AS build
WORKDIR /spc

COPY . /spc

RUN mvn clean package -DskipTests


FROM amazoncorretto:17-alpine-jdk
WORKDIR /apps

COPY --from=build /spc/target/spring-petclinic-3.4.0-SNAPSHOT.jar /apps/spring-petclinic-3.4.0-SNAPSHOT.jar


CMD ["java", "-jar", "spring-petclinic-3.4.0-SNAPSHOT.jar"]
