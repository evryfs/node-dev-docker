# node-dev-docker

## Tags

* node10
* latest -> to whatever is latest node LTS, which is currently node10
* node8: discontinued - won't be updated

## The image contains tooling for:
* ng
* [npm](https://www.npmjs.com/get-npm)
* [yarn](https://yarnpkg.com)
* headless [karma](https://karma-runner.github.io/2.0/index.html) browser-testing in Chrome and Firefox
* [sonar-scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)
* [owasp dependency-check](https://jeremylong.github.io/DependencyCheck/dependency-check-cli/arguments.html)

which makes it ideal for being the build-environment in CI/Jenkins.

## Use
The source to build should be mounted in /app.

Set GOSU_USER=<uid>:<gid> to the UID of the user running the image (typically Jenkins),
this ensures that the "node" user will get this uid/gid, and chown node's home, /home/node
which contains tooling - this again make files generated during the build to match the out-of-container ownership.


[![](https://images.microbadger.com/badges/version/evryfs/node-dev-docker.svg)](https://microbadger.com/images/evryfs/node-dev-docker "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/evryfs/node-dev-docker.svg)](https://microbadger.com/images/evryfs/node-dev-docker "Get your own image badge on microbadger.com")
![Docker Build Status](https://img.shields.io/docker/build/evryfs/node-dev-docker.svg)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/evryfs/node-dev-docker.svg)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=evryfs/node-dev-docker)](https://dependabot.com)

