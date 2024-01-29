FROM gradle:8.5.0-jdk17 AS builder
WORKDIR /app

# 그래들 파일이 변경되었을 때만 새롭게 의존패키지 다운로드 받게함.
COPY build.gradle settings.gradle
RUN gradle build -x test --parallel --continue > /dev/null 2>&1 || true

# 빌더 이미지에서 애플리케이션 빌드
COPY . .
RUN gradle build -x test --parallel

# APP
FROM openjdk:17-jdk-slim
WORKDIR /app

# 빌더 이미지에서 jar 파일만 복사
COPY --from=builder /app/build/libs/*.jar app.jar

EXPOSE 80
# 프로필 환경변수 사용 시!
ENTRYPOINT ["java","-jar","-Dspring.profiles.active=${ACTIVE_PROFILE}","app.jar"]