#!/bin/bash

# Bash script for installing Swift version on Linux Ubuntu 14.04
# Need to refactor this in the future for handling future versions of
# the Swift language.

set -e

DIR="$(pwd)"
# export SWIFT_VERSION=swift-3.1.1-RELEASE
wget https://swift.org/builds/swift-4.0-branch/ubuntu1404/swift-4.0-DEVELOPMENT-SNAPSHOT-2017-09-13-a/swift-4.0-DEVELOPMENT-SNAPSHOT-2017-09-13-a-ubuntu14.04.tar.gz
tar xzf swift-4.0-DEVELOPMENT-SNAPSHOT-2017-09-13-a-ubuntu14.04.tar.gz
export PATH="${PWD}/swift-4.0-DEVELOPMENT-SNAPSHOT-2017-09-13-a-ubuntu14.04/usr/bin:${PATH}"
cd "$DIR"