FROM maven:3.9-eclipse-temurin-21 AS build
ENV LANG=C.UTF-8
WORKDIR /app
COPY pom.xml .
COPY src ./src
COPY src/main/resources/application-template.yml src/main/resources/application.yml
RUN mvn clean package -DskipTests

FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8888
ENTRYPOINT ["java", "-jar", "app.jar"]
