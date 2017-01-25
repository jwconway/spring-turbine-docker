FROM anapsix/alpine-java:8_jdk

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Bundle app source
COPY . /app

RUN chmod +x ./gradlew

# Build the solution (using the gradle task)
RUN ./gradlew dockerBuild

EXPOSE 8989 8080

ENTRYPOINT exec java $JAVA_OPTS -jar build/libs/tombola.turbine.jar