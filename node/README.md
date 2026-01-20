# Javascript

Maintaining `node` versions, as well as `npm`, has proven to be a pain in the ass.
With so many javascript runtimes available, there is no need to install `node/npm` system wide. 
Therefore all of the images requiring node (or any other JS runtime) will be purely maintained through Docker.

## Node Dockerfile

The Dockerfile is a continuation of `node:alpine` docker image.

`npm` and `ncu (npm-check-updates)` are globally installed.

`Dockerfile` has argument `ARG NODE_DIR=/home/node/app` by default. `Makefile` serves to exploit this ARG for better readability;

NOTE: We might be changing permissions in the future depending on the image's sensitivity.

All of the images created by `make docker-build` have different working directories but are ultimately the same.


