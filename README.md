[![Docker Stars](https://img.shields.io/docker/stars/mlabbe/iperf3.svg)](https://hub.docker.com/r/mlabbe/iperf3/) [![Docker Pulls](https://img.shields.io/docker/pulls/mlabbe/iperf3.svg)](https://hub.docker.com/r/mlabbe/iperf3/)

# docker: iperf3

This is a Docker image to run the [iperf3](https://github.com/esnet/iperf) commandline tool in server mode for benchmarking network performance.

```sh
Connecting to host speedtest.mydomain.local, port 5201
[  4] local 192.168.1.100 port 53917 connected to 192.168.1.50 port 5201
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-1.00   sec   112 MBytes   941 Mbits/sec
[  4]   1.00-2.00   sec   112 MBytes   942 Mbits/sec
[  4]   2.00-3.00   sec   112 MBytes   942 Mbits/sec
[  4]   3.00-4.00   sec   112 MBytes   943 Mbits/sec
[  4]   4.00-5.00   sec   112 MBytes   941 Mbits/sec
[  4]   5.00-6.00   sec   112 MBytes   942 Mbits/sec
[  4]   6.00-7.00   sec   112 MBytes   942 Mbits/sec
[  4]   7.00-8.00   sec   112 MBytes   942 Mbits/sec
[  4]   8.00-9.00   sec   112 MBytes   942 Mbits/sec
[  4]   9.00-10.00  sec   112 MBytes   942 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth
[  4]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec                  sender
[  4]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec                  receiver

iperf Done.
```

- Runs as non-root user
- Small image size
- Small number of layers

Total size of this image is only:

[![](https://images.microbadger.com/badges/image/mlabbe/iperf3.svg)](https://microbadger.com/images/mlabbe/iperf3)

________________________________________
### Pulling from Docker hub
If you want to obtain the image from Docker registry, you can use the following command:
```sh
docker pull mlabbe/iperf3
```
________________________________________
### Running the image
In order to run the iperf server, use the following:
```sh
docker run --restart=unless-stopped --name=iperf3 -d -p 5201:5201 mlabbe/iperf3
```
At that point, you can use your Docker server as an iperf3 server to begin
benchmarking your network speeds.
