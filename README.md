# golang-ubi8

[![Container Repository on Quay](https://quay.io/repository/kenmoini/golang-ubi/status "Container Repository on Quay")](https://quay.io/repository/kenmoini/golang-ubi)

A Golang builder container based on RHEL UBI 8.

This container image is available on Quay and should be a drop-in replacement for the official Golang containers on Docker Hub that are based on Alpine and Ubuntu.

## Pulling the Container

```bash
podman pull quay.io/kenmoini/golang-ubi:latest
# or
docker pull quay.io/kenmoini/golang-ubi:latest
```

## Tags

- `:latest`, `:1.16.2`

# Licenses

- The Red Hat Universal Base Image is covered by [its own EULA](https://www.redhat.com/licenses/EULA_Red_Hat_Universal_Base_Image_English_20190422.pdf)
- Golang is covered by [its own license](https://golang.org/LICENSE) as well
- Custom authored work in this repository is otherwise covered by the MIT license found in the file `LICENSE`
