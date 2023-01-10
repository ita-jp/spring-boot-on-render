FROM openjdk:17-jdk-slim-bullseye AS build
COPY ./ /home/app
RUN cd /home/app && ./gradlew build

FROM gcr.io/distroless/java17-debian11
COPY --from=build /home/app/build/libs/sample-0.0.1-SNAPSHOT.jar /usr/local/lib/sample-0.0.1-SNAPSHOT.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","-Dfile.encoding=UTF-8","/usr/local/lib/sample-0.0.1-SNAPSHOT.jar"]
