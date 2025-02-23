#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

IMAGE_DIR="$(basename "$(cd "$(dirname ${BASH_SOURCE[0]})/.." && pwd )")"
IMAGE_NAME=${IMAGE_NAME:-"cgr.dev/chainguard/${IMAGE_DIR}:latest"}

cd "$(dirname ${BASH_SOURCE[0]})/.."

docker build --build-arg BASE="${IMAGE_NAME}" --tag smoke-test --file examples/Dockerfile.c examples
docker run --rm smoke-test
