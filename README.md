# Moodle Images

Moodle images maintained by UIC College of Pharmacy.

Each Moodle version has its own directory containing a `Dockerfile`, and the directory
name is the image tag.

| Version | Base image                         | Change                                               |
| ------- | ---------------------------------- | ---------------------------------------------------- |
| `5.1`   | `ghcr.io/uicpharm/moodle:5.0.2`    | Apache document root set to `/bitnami/moodle/public` |

## Build

Builds target `linux/amd64` and `linux/arm64` by default, using a `moodle-multiarch`
buildx builder that the script creates on first run. Extra arguments are passed to
`docker buildx build`.

```sh
./build.sh 5.1                                 # build both architectures (cache only)
./build.sh 5.1 --push                          # build both and push the multi-arch image
./build.sh 5.1 --platform linux/arm64 --load   # single arch, load into local Docker
```

A multi-platform result can't be loaded into the local image store, so use `--push` to
publish it. Without `--push` or `--load`, the build only validates and fills the cache.

To add a version, create a new `<version>/Dockerfile`.
