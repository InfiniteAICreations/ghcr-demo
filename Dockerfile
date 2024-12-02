FROM openjdk:22-slim

RUN apt-get update --fix-missing && apt-get install -y ffmpeg && apt clean && rm -rf /var/lib/apt/lists/*
