# Step 1: Use a lightweight JDK 21 image
FROM eclipse-temurin:21-jre-jammy

# Step 2: Create a directory for the app
WORKDIR /app

# Step 3: Copy the JAR file from your Gradle build folder
# Note: Gradle puts the jar in build/libs/, Maven puts it in target/
COPY build/libs/*.jar app.jar

# Step 4: Expose the port Spring Boot runs on (default 8080)
EXPOSE 8080

# Step 5: Run the application with optimized memory settings
# Since you have an xlarge, we can give the JVM a healthy heap
ENTRYPOINT ["java", "-Xmx2g", "-jar", "app.jar"]