# STAGE 1: Build the package
FROM ubuntu:26.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

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

WORKDIR /src
RUN git clone --recurse-submodules https://github.com/MisterTea/EternalTerminal.git

WORKDIR /src/EternalTerminal/build
RUN cmake -G "Unix Makefiles" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCPACK_GENERATOR=DEB \
    -DDISABLE_VCPKG=ON \
    .. && \
    make -j$(nproc) && \
    cpack

# STAGE 2: Export only the .deb
# We use 'scratch' because it's an empty, zero-byte image
FROM scratch AS export
COPY --from=builder /src/EternalTerminal/build/*.deb /
