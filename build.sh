#!/usr/bin/env bash
set -euo pipefail

version="${1:?Usage: $0 <version> [docker buildx build args...]}"
shift
cd "$(dirname "$0")"
[[ -f "$version/Dockerfile" ]] || { echo "No Dockerfile for version $version" >&2; exit 1; }

# The default docker driver can't build multi-platform images.
builder=moodle-multiarch
docker buildx inspect "$builder" >/dev/null 2>&1 \
  || docker buildx create --name "$builder" --driver docker-container >/dev/null

# Later flags win, so passing --platform overrides the default.
docker buildx build --builder "$builder" --platform linux/amd64,linux/arm64 \
  -t "ghcr.io/uicpharm/moodle:$version" "$@" "$version"
