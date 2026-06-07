# Stage 1 - Build and Test
FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean test

# Stage 2 - Copy Reports
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

COPY --from=build /app/target/surefire-reports ./test-reports

CMD ["sh", "-c", "echo 'All tests passed. Reports saved in /app/test-reports' && ls -la test-reports"]