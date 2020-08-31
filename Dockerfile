FROM maven:3.5.2-jdk-8-alpine AS MAVEN_TOOL_CHAIN
COPY pom.xml /tmp/
COPY src /tmp/src/
WORKDIR /tmp/
RUN mvn package

FROM tomcat:9.0-jre8
COPY --from=MAVEN_TOOL_CHAIN /tmp/target/gs-spring-boot-docker-0.1.0.war /usr/local/tomcat/webapps/myapp.war
