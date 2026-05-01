# Eternal Terminal Builder for Ubuntu 26.04 LTS

**Build**

* `DOCKER_BUILDKIT=1 docker build --network host --target export -o . --progress=plain . 2>&1 | tee build.log`

**Install**
* `sudo dpkg -i EternalTerminal-*.deb`
* `systemctl status et`
* `et yourserver`
