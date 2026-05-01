FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build \
    git \
    pkg-config \
    libprotobuf-dev \
    protobuf-compiler \
    libsodium-dev \
    libutempter-dev \
    libcurl4-openssl-dev \
    libgflags-dev \
    libboost-all-dev \
    libuv1-dev \
    zlib1g-dev \
    && rm -rf /var/lib/apt/lists/*

# Clone ET
WORKDIR /src
RUN git clone --recurse-submodules https://github.com/MisterTea/EternalTerminal.git

# Build and Pack
WORKDIR /src/EternalTerminal/build
RUN cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCPACK_GENERATOR=DEB \
    -DDISABLE_VCPKG=ON \
    .. && \
    make -j$(nproc) && \
    cpack
