FROM docker pull arm64v8/python

# 设置工作目录
WORKDIR /app

# 复制当前目录下的所有文件到容器的 /app 目录
COPY . /app

# 安装系统依赖（如果需要）
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# 安装 Python 依赖
RUN pip install --no-cache-dir \
    paho-mqtt==1.6.1 \
    numpy==1.23.2 \
    Pillow \
    loguru \
    requests \
    psutil \
    pycuda \
    opencv-python \
    fastapi \
    uvicorn \
    paramiko \
    scp
