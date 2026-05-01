# Eternal Terminal Builder for Alpine Linux


**Build**

* `DOCKER_BUILDKIT=1 docker build --target export --output . --progress=plain . 2>&1 | tee build.log`

**Install**
* `apk add --allow-untrusted et-6.2.4-r0.apk et-server-6.2.4-r0.apk eternalterminal-6.2.4-r0.apk`
* `rc-service etserver start` (start server)
* `rc-update add etserver default` (enable server on startup)
* `et yourserver`
