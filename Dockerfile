# Use a base image with Maven to build the application
FROM maven:3.8.5-openjdk-17 as build

# Set the working directory in the container
WORKDIR /app

# Copy the entire project to the container
COPY . .

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use another base image with OpenJDK for running the application
FROM openjdk:17.0.1-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the build stage to the container
COPY --from=build /target/ang-connection-0.0.1-SNAPSHOT.jar ang-connection.jar

# Expose the port on which the Spring Boot application will run
EXPOSE 8080

# Set environment variables for MySQL connection
ENV SPRING_DATASOURCE_URL=jdbc:mysql://dbservice:3306/connectionDB1?createDatabaseIfNotExist=true
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=adminuser

# Command to run the Spring Boot application
CMD ["java", "-jar", "ang-connection.jar"]




# # means here we're importing this image for our application
# # so this part compile and package our app
# FROM maven:3.8.5-openjdk-17 as build
# # this means copy everything from this file into the above image 
# COPY . . 
# # now this command install our application
# RUN mvn clean package -DskipTests



# # this part gonna run our application
# # now import openJdk image
# FROM openjdk:17.0.1-jdk-slim
# # this means we're coping the maven image and then 
# # defined our jar file location here and created in new container
# COPY --from=build /target/ang-connection-0.0.1-SNAPSHOT.jar ang-connection.jar

# EXPOSE 8080
# ENTRYPOINT [ "java", "-jar", "ang-connection.jar" ]


