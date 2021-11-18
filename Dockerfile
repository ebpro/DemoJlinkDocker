FROM maven:3.8.3-eclipse-temurin-17 as build       

WORKDIR /app

COPY pom.xml .
COPY src src

RUN --mount=type=cache,id=mvncache,target=/root/.m2/repository,rw \
	mvn -B package

FROM eclipse-temurin:17-jdk-alpine

COPY --from=build /app/target/*-with-dependencies.jar \
                  /app/myapp.jar

ENTRYPOINT ["java", "-jar"]
CMD ["/app/myapp.jar"]
