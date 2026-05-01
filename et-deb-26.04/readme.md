**build**

`DOCKER_BUILDKIT=1 docker build --network host --target export -o . --progress=plain . 2>&1 | tee build.log`
