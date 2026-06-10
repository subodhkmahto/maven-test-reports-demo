# Stage 1 - Build and Test
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean test

# Stage 2 - Complete Static Nginx Server
FROM nginx:alpine
RUN echo 'server { listen 80; location / { root /usr/share/nginx/html; autoindex on; autoindex_exact_size off; autoindex_localtime on; } }' > /etc/nginx/conf.d/default.conf
COPY --from=build /app/target/surefire-reports /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]



## Stage 1 - Build and Test
#FROM maven:3.9.6-eclipse-temurin-17 AS build
#
#WORKDIR /app
#
#COPY pom.xml .
#COPY src ./src
#
#RUN mvn clean test
#
## Stage 2 - Copy Reports
#FROM eclipse-temurin:17-jre-alpine
#
#WORKDIR /app
#
#COPY --from=build /app/target/surefire-reports ./test-reports
#
#CMD ["sh", "-c", "echo 'All tests passed. Reports saved in /app/test-reports' && ls -la test-reports"]