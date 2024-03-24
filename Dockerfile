# Use an official Maven image as the build environment
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the project's pom.xml file
COPY pom.xml .

# Copy the settings file which is created by the github action workflows
# COPY settings.xml /root/.m2/settings.xml

# Download the project dependencies
RUN mvn dependency:go-offline -B

# Copy the project source code
COPY src ./src

# Build the application
RUN mvn package -DskipTests

# Use a lightweight Java runtime image as the base image
FROM eclipse-temurin:17

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the previous stage
COPY --from=build /app/target/*.jar ./app.jar

# Expose the application port (change it to your application's port)
EXPOSE 8080

# Set the command to run the application
CMD ["java", "-jar", "app.jar"]
