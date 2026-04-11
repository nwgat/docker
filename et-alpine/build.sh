DOCKER_BUILDKIT=1 docker build --target export --output . --progress=plain . 2>&1 | tee build.log
