# Actions for GitHub

## Release artifacts

```console
action "Release" {
  uses = "pottava/github-actions/github/release@master"
}
```

options:

Environment Variables     |                                                        |
------------------------- | ------------------------------------------------------ |
ARTIFACT_DIR              | Specify artifact directory (default: dist/)            |
