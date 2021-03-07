FROM adoptopenjdk/openjdk11:jdk-11.0.10_9-debian
RUN addgroup --system spring && adduser --no-create-home --system spring && usermod -g spring spring
USER spring:spring
ARG DEPENDENCY=target/dependency
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","de.dbck.poc.pochelloworld.WebApplication"]