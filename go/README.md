# Actions for Go

## Run codegen with go-swagger/go-swagger v0.16.0

```console
action "RunCodegen" {
  uses = "pottava/github-actions/go/codegen@master"
  args = "generate server -f swagger.yaml"
}
```

## Solve dependencies with golang/dep v0.5

```console
action "SolveGoDeps" {
  uses = "pottava/github-actions/go/deps@master"
}
```

options:

Environment Variables     |                                                        |
------------------------- | ------------------------------------------------------ |
SRC_DIR                   | Specify source directory (default: .)                  |

## Run static analysis with golangci/golangci-lint v1.12.3

```console
action "RunGoStaticAnalysis" {
  needs = ["Deps"]
  uses = "pottava/github-actions/go/lint@master"
}
```

options:

Environment Variables     |                                                        |
------------------------- | ------------------------------------------------------ |
SRC_DIR                   | Specify source directory (default: .)                  |

## Run unit tests with golang v1.11.2

```console
action "RunGoUnitTests" {
  needs = ["Deps"]
  uses = "pottava/github-actions/go/test@master"
  env = {
    SRC_DIR = "src/"
    IGNORE_DIR = "/generated/"
  }
}
```

options:

Environment Variables     |                                                        |
------------------------- | ------------------------------------------------------ |
SRC_DIR                   | Specify source directory (default: .)                  |
IGNORE_DIR                | Directories which will be ignored for unit testing.    |

## Build the app with mitchellh/gox & golang v1.11.1

```console
action "BuildGoApps" {
  needs = ["Deps"]
  uses = "pottava/github-actions/go/build@master"
  env = {
    POST_PROCESS = "github_release"
  }
  secrets = ["GITHUB_TOKEN"]
}
```

options:

Environment Variables     |                                                        |
------------------------- | ------------------------------------------------------ |
POST_PROCESS              | `github_release` if you'd like to upload the binaries. |
GITHUB_TOKEN              | set as one of secrets if you specify `github_release`. |
SRC_DIR                   | Specify source directory (default: .)                  |
