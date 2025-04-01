# -buster is required to have apt available
FROM eclipse-temurin:23_37-jre-alpine

# Optional JVM arguments, such as memory settings
ARG JVM_ARGS=""
ARG JAR

RUN apk --no-cache add curl

WORKDIR /app

COPY build/libs/opentelemetry-javaagent.jar /app/opentelemetry-javaagent.jar
COPY build/libs/opentelemetry-exporter-otlp.jar /app/opentelemetry-exporter-otlp.jar
COPY ${JAR} sts.jar

EXPOSE 8188

ENV WEB_HTTP_PORT="8080"
ENV WEB_HTTP_PATH="/api"

HEALTHCHECK --interval=5s --timeout=5s --retries=10 CMD curl --fail http://localhost:8080/api/check/health

# Use "exec" for graceful termination (SIGINT) to reach JVM.
# ARG can not be used in ENTRYPOINT so storing value in an ENV variable
ENV ENV_JVM_ARGS=$JVM_ARGS
ENTRYPOINT [ "sh", "-c", "exec java $ENV_JVM_ARGS -javaagent:/app/opentelemetry-javaagent.jar -Djava.util.logging.config.file=/open-telemetry/resources/logging.properties -jar sts.jar --log-level=debug"]