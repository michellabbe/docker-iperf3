[![Docker Stars](https://img.shields.io/docker/stars/mlabbe/iperf3.svg)](https://hub.docker.com/r/mlabbe/iperf3/) [![Docker Pulls](https://img.shields.io/docker/pulls/mlabbe/iperf3.svg)](https://hub.docker.com/r/mlabbe/iperf3/)

# docker: iperf3
================

This is a Docker image to run the [iperf3](https://github.com/esnet/iperf) commandline tool for benchmarking network performance.

Total size of this image is:
[![](https://badge.imagelayers.io/mlabbe/iperf3:latest.svg)](https://imagelayers.io/?images=mlabbe/iperf3:latest)


### Pulling from Docker hub
---------------------------
If you want to obtain the image from Docker registry, you can use the following command:
```sh
docker pull mlabbe/iperf3
```
### Running the image
---------------------
In order to run the iperf server, use the following:
```sh
docker run --name=iperf3 -d -p 5201:5201 mlabbe/iperf3
```
At that point, you can use your Docker server as an iperf server to begin
benchmarking your network speeds.
