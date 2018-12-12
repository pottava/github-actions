# Actions for Docker

## Login

```console
action "Login" {
  uses = "pottava/github-actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
}
```

options:

Environment Variables     |                                                        |
------------------------- | ------------------------------------------------------ |
DOCKER_USERNAME           | User name for Docker registry.                         |
DOCKER_PASSWORD           | Password for Docker registry.                          |
REGISTRY_ENDPOINT         | Docker registry endpoint. (Default: DockerHub)         |
AWS_ACCESS_KEY_ID         | Specify AWS access key if you'd like to use ECR.       |
AWS_SECRET_ACCESS_KEY     | Specify AWS secret key if you'd like to use ECR.       |
AWS_DEFAULT_REGION        | AWS region. (Default: us-east-1)                       |

## Build

`$version` will be replaced with git branch or tag.

```console
action "Build" {
  uses = "pottava/github-actions/docker/build@master"
  args = "foo/bar:${version}-${GITHUB_SHA:0:7}"
}
```

arguments:

docker image name (+ tag).

options:

Environment Variables     |                                                        |
------------------------- | ------------------------------------------------------ |
DOCKERFILE                | Specify your Dockerfile. (Default: ./Dockerfile)       |
BUILD_OPTIONS             | Specify docker build options if you need.              |
BUILD_DIRECTORY           | Build context. (Default: . )                           |

## Tag

`$version` will be replaced with git branch or tag.

```console
action "Tag" {
  uses = "pottava/github-actions/docker/tag@master"
  env = {
    SRC_IMAGE = "foo/bar:1.2"
    DST_IMAGE = "foo/bar:latest"
  }
}
```

options:

Environment Variables     |                       |
------------------------- | --------------------- |
SRC_IMAGE                 | source image (+ tag). |
DST_IMAGE                 | target image (+ tag). |

## Push

`$version` will be replaced with git branch or tag.

```console
action "Push" {
  uses = "pottava/github-actions/docker/push@master"
  args = "foo/bar:stable,foo/bar:latest"
}
```

arguments:

comma seperated docker images to be pushed.
