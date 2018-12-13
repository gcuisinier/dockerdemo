FROM maven:3.6-jdk-8-alpine as builder

COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package -DskipTests

FROM java:8-jre-alpine
COPY --from=builder /usr/src/app/target/docker-demi-0.0.1-SNAPSHOT.jar /usr/app/docker-demo.jar  
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/usr/app/docker-demo.jar"]  