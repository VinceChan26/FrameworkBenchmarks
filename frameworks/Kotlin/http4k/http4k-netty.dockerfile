FROM gradle:4.7.0-jdk10
USER root
WORKDIR /http4k
COPY build.gradle build.gradle
COPY settings.gradle settings.gradle
COPY apache apache
COPY core core
COPY jetty jetty
COPY netty netty
COPY sunhttp sunhttp
COPY undertow undertow
RUN gradle --quiet build netty:shadowJar
CMD ["java", "-server", "-XX:+UseNUMA", "-XX:+UseParallelGC", "-XX:+AggressiveOpts", "-XX:+AlwaysPreTouch", "-jar", "netty/build/libs/http4k-netty-benchmark.jar"]
