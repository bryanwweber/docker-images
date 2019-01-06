# docker-images

Docker images that are useful to me

## ThermoState

To build and upload the image, run

    docker pull jupyter/minimal-notebook:latest
    docker build -t bryanwweber/thermostate:latest thermostate
    docker push bryanwweber/thermostate:latest
