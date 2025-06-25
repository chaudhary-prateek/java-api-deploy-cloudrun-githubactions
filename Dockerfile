# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Compile the Java project (assuming a single Main.java file)
# If you use Maven or Gradle, replace these lines accordingly
RUN javac Main.java

# Run the application
CMD ["java", "Main"]