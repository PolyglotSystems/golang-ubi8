# golang-ubi8

[![Container Image on Quay](https://img.shields.io/badge/Container%20Image-Quay.io-orange)](https://quay.io/polyglotsystems/golang-ubi) ![GitHub Workflow Status](https://img.shields.io/github/workflow/status/PolyglotSystems/golang-ubi8/Build%20Golang%20UBI%20Container?label=Container%20Build&style=flat-square) ![GitHub](https://img.shields.io/github/license/PolyglotSystems/golang-ubi8) ![GitHub release (latest by date)](https://img.shields.io/github/v/release/PolyglotSystems/golang-ubi8)

A Golang builder container based on RHEL UBI 8.

This container image is available on Quay and should be a drop-in replacement for the official Golang containers on Docker Hub that are based on Alpine and Ubuntu - without the Docker Hub pull limits.

## Pulling the Container

```bash
podman pull quay.io/polyglotsystems/golang-ubi:latest
# or
docker pull quay.io/polyglotsystems/golang-ubi:latest
```

## Tags

- `:latest`, `:1.17`, `:1.17.1`
- `:1.16.2`

# Licenses

- The Red Hat Universal Base Image is covered by [its own EULA](https://www.redhat.com/licenses/EULA_Red_Hat_Universal_Base_Image_English_20190422.pdf)
- Golang is covered by [its own license](https://golang.org/LICENSE) as well
- Custom authored work in this repository is otherwise covered by the MIT license found in the file `LICENSE`
