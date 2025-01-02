# Building stage
FROM eclipse-temurin:17-jdk-alpine AS builder
COPY . /spc
WORKDIR /spc
RUN chmod +x mvnw && ./mvnw clean package 

# Creating the final image
FROM gcr.io/distroless/java17-debian12 AS runner
WORKDIR /spc
COPY --from=builder /spc/target/*.jar /spc/data/spring.jar


EXPOSE 8080

# Run the Spring Boot application
CMD ["java", "-jar", "/spc/data/spring.jar"]
