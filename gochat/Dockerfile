FROM python:3.12-slim AS build

RUN apt-get update && \
    apt-get install -y --fix-missing build-essential && \
    rm -rf /var/lib/apt/lists/*

# 安装 chromadb
RUN pip install chromadb

# 第二阶段：生成最终镜像
FROM python:3.12-slim

# 从第一阶段复制 chromadb 安装结果
COPY --from=build /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

RUN pip install --no-cache-dir fastapi uvicorn authlib \
    httpx pydantic_settings python-jose passlib llama-index \
    pymysql mysql-connector-python itsdangerous python-multipart