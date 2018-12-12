# Actions for GitHub

## Release artifacts

```console
action "Release" {
  uses = "pottava/github-actions/github/release@master"
  env = {
    ARTIFACT_DIR = "app/dist/"
  }
  secrets = ["GITHUB_TOKEN"]
}
```

options:

Environment Variables     |                                                        |
------------------------- | ------------------------------------------------------ |
ARTIFACT_DIR              | Specify artifact directory (default: dist/)            |
