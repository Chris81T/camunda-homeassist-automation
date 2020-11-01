FROM openjdk:11-jre-slim
MAINTAINER Christian Thomas <christian@ckthomas.de>
COPY ./target/container-build/camunda-homeassist-automation-0.0.7-SNAPSHOT.jar /usr/src/camunda-homeassist/
WORKDIR /usr/src/camunda-homeassist
CMD ["java", "-jar", "camunda-homeassist-automation-0.0.7-SNAPSHOT.jar"]
