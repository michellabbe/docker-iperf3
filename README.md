# docker: iperf3

This is a Docker image to run the [iperf3](https://github.com/esnet/iperf) commandline tool for benchmarking network performance.

### Pulling from Docker hub
If you want to obtain the image from Docker registry, you can use the following command:
```
docker pull mlabbe/iperf3
```
### Running the image
In order to run the iperf server, use the following:
```
docker run -d -p 5201:5201 mlabbe/iperf3
```
At that point, you can use your Docker server as an iperf server to begin
benchmarking your network speeds.
