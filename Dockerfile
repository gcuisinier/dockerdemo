FROM java:8-jre-alpine
COPY target/docker-demi-0.0.1-SNAPSHOT.jar demo-demi.jar
CMD java -jar demo-demi.jar