# Stage 1 — Build aur Test
FROM maven:3.9.6-eclipse-temurin-17 AS build
# Maven aur Java 17 wali base image

WORKDIR /app
# container ke andar /app folder mein kaam karenge

COPY pom.xml .
# pom.xml copy karo (dependencies ke liye)

COPY src ./src
# source code copy karo

RUN mvn clean test
# tests run karo — agar koi test fail hua to build rok dega

# Stage 2 — Reports save karo
FROM eclipse-temurin:17-jre-alpine
# lightweight Java runtime image

WORKDIR /app

COPY --from=build /app/target/surefire-reports ./test-reports
# stage 1 se test reports copy karo

CMD ["sh", "-c", "echo 'All tests passed. Reports saved in /app/test-reports' && ls -la test-reports"]
# container start hone par reports list dikhayega