# Usa a imagem oficial do Ubuntu como base
FROM ubuntu:20.04

# Define variáveis para evitar interações na instalação
ENV DEBIAN_FRONTEND=noninteractive

# Atualiza pacotes e instala dependências
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    g++ \
    python3 \
    python3-pip \
    libx11-dev \
    libxext-dev \
    libxrandr-dev \
    libxrender-dev \
    libglu1-mesa-dev \
    mesa-utils \
    x11-apps \
    git \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# Define diretório de trabalho
WORKDIR /opt

# Clona o repositório do ORTS
RUN git clone https://github.com/ericvh/ORTS.git

# Acessa a pasta do ORTS
WORKDIR /opt/ORTS

# Compila e instala o ORTS
RUN ./configure && make -j$(nproc) && make install

# Expõe a porta padrão do ORTS
EXPOSE 5000

# Comando para iniciar o servidor ORTS
CMD ["./server"]
