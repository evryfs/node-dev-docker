#!/bin/bash

set -e

which ng
node --version
ng version
npm version
yarn --version
yarn config list
dependency-check.sh --version
sonar-scanner --version
