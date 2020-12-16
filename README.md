# GitHub Actions for Preact

This Action for [preact-cli](https://github.com/preactjs/preact-cli) enables arbitrary actions with the `preact` command-line client.

## Inputs

* `args` - **Required**. This is the arguments you want to use for the `preact` cli


## Example

Build preact project, and deploy to Firebase Hosting:

```yaml
name: Build and Deploy
on:
  push:
    branches:
      - master

jobs:
  build:
    name: Build
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@master
      - name: Install Dependencies
        run: npm install
      - name: Build Project
        uses: ImJustChew/preact-action@master
        with:
          args: preact build
      - name: Archive Production Artifact
        uses: actions/upload-artifact@master
        with:
          name: build
          path: build
  deploy:
    name: Deploy
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@master
      - name: Download Artifact
        uses: actions/download-artifact@master
        with:
          name: build
          path: build
      - name: Deploy to Firebase
        uses: w9jds/firebase-action@master
        with:
          args: deploy --only hosting
        env:
          FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
```

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).

This repo is forked and modified from [Firebase Action](https://github.com/w9jds/firebase-action)