[![build](https://github.com/evryfs/node-dev-docker/actions/workflows/build.yaml/badge.svg)](https://github.com/evryfs/node-dev-docker/actions/workflows/build.yaml)

# archived

No longer maintained as github actions offer a better experience than Jenkins.

# node-dev-docker

## Tags / versions

See branches for actively maintained versions.

## The image contains tooling and libs for:
* [npm](https://www.npmjs.com/get-npm)
* [yarn](https://yarnpkg.com)
* headless [karma](https://karma-runner.github.io/2.0/index.html) browser-testing in Chrome and Firefox
* [sonar-scanner](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner)
* [Cypress](https://docs.cypress.io/)

which makes it ideal for being the build-environment in CI/Jenkins.

## Use
The source to build should be mounted in /app.

Set GOSU_USER=<uid>:<gid> to the UID of the user running the image (typically Jenkins),
this ensures that the "node" user will get this uid/gid, and chown node's home, /home/node
which contains tooling - this again make files generated during the build to match the out-of-container ownership.
