# Use Maven + JDK image for build
FROM maven:3.9.6-eclipse-temurin-17 as builder

# Set working directory
WORKDIR /app

# Copy source
COPY . .

# Package the app (skip tests if needed)
RUN mvn clean package -Dmaven.test.skip=true


# Use a lighter JDK base image for running the app
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy the built jar file from builder stage
COPY --from=builder /app/target/*.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
