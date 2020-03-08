name: M4_IMAGE

on:
  push:
    paths:
      - 'M4_IMAGE/**'
      - '.github/workflows/M4_IMAGE.yml'

jobs:
  build:
    runs-on: ubuntu-latest
    env:
      IMAGE_ID: docker.pkg.github.com/iamwillbar/dockerfiles/M4_IMAGE
    steps:
    - uses: actions/checkout@v1
    - name: Generate a tag
      run: echo ::set-output name=tag::$(date +%s)
      id: tag
    - name: Build the Docker image
      run:  docker build . --file Dockerfile -t $IMAGE_ID:${{ steps.tag.outputs.tag }} -t $IMAGE_ID:latest
      working-directory: ./M4_IMAGE
    - name: Login to GPR
      run: docker login -u iamwillbar -p $GITHUB_TOKEN docker.pkg.github.com
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
    - name: Push to GPR
      run: docker push $IMAGE_ID:${{ steps.tag.outputs.tag }} && docker push $IMAGE_ID:latest
