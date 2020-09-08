FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM openjdk
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/spring-boot-docker.jar /spring-boot-docker.jar
EXPOSE 8080
CMD ["java", "-jar", "spring-boot-docker.jar"]
