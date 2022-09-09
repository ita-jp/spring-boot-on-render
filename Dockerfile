#
# Build stage
#
FROM gradle:7.5.1-jdk17  AS build
COPY src /home/app/src
COPY settings.gradle /home/app
COPY build.gradle /home/app
COPY gradle /home/app/gradle
COPY gradlew /home/app/
RUN cd /home/app && ./gradlew clean build

#
# Package stage
#
FROM openjdk:17-jdk-slim
COPY --from=build /home/app/build/libs/sample-0.0.1-SNAPSHOT.jar /usr/local/lib/app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/local/lib/app.jar"]