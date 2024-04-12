# means here we're importing this image for our application
# so this part compile and package our app
FROM maven:3.8.5-openjdk-17 as build
# this means copy everything from this file into the above image 
COPY . . 
# now this command install our application
RUN mvn clean package -DskipTests



# this part gonna run our application
# now import openJdk image
FROM openjdk:17.0.1-jdk-slim
# this means we're coping the maven image and then 
# defined our jar file location here and created in new container
COPY --from=build /target/ang-connection-0.0.1-SNAPSHOT.jar ang-connection.jar

EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "ang-connection.jar" ]


