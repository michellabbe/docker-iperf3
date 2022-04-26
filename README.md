# iperf3

[![Docker Image Version (tag latest semver)](https://img.shields.io/docker/v/mlabbe/iperf3/latest?logo=docker)](https://hub.docker.com/r/mlabbe/iperf3 "Docker Hub Repository") ![Docker Image Size (latest semver)](https://img.shields.io/docker/image-size/mlabbe/iperf3/latest?logo=docker) ![User Privilege](https://img.shields.io/badge/user%20privilege-non--root-success?logo=docker) ![Health Check](https://img.shields.io/badge/health%20check-yes-success?logo=docker)  
![Docker Pulls](https://img.shields.io/docker/pulls/mlabbe/iperf3?logo=docker) ![Docker Stars](https://img.shields.io/docker/stars/mlabbe/iperf3?logo=docker) ![GitHub License](https://img.shields.io/github/license/michellabbe/docker-iperf3?logo=github) 

This is a Docker image to run the [iperf3](https://github.com/esnet/iperf) commandline tool in server mode.
iPerf3 (iPerf v3) is a tool for active measurements of the maximum achievable bandwidth on IP networks.
It supports tuning of various parameters related to timing, buffers and protocols (TCP, UDP, with IPv4 and IPv6).
For each test it reports the bandwidth, loss, and other parameters.

________________________________________
```sh
C:\Users\Example>iperf3 -c speedtest.mydomain.local
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
________________________________________
```sh
C:\Users\Example>iperf3 -R -O 1 -u -b 50M -c speedtest.mydomain.local
Connecting to host speedtest.mydomain.local, port 5201
[  4] local 192.168.1.100 port 60469 connected to 192.168.1.50 port 5201
Reverse mode, remote host speedtest.mydomain.local is sending
[  4]   0.00-1.00   sec  6.17 MBytes  51.7 Mbits/sec  0.034 ms  23/813 (2.8%)  (omitted)
[  4]   0.00-1.00   sec  5.97 MBytes  50.0 Mbits/sec  0.028 ms  0/764 (0%)
[  4]   1.00-2.00   sec  5.96 MBytes  50.0 Mbits/sec  0.018 ms  0/763 (0%)
[  4]   2.00-3.00   sec  5.96 MBytes  50.0 Mbits/sec  0.016 ms  0/763 (0%)
[  4]   3.00-4.00   sec  5.96 MBytes  50.0 Mbits/sec  0.018 ms  0/763 (0%)
[  4]   4.00-5.00   sec  5.96 MBytes  50.0 Mbits/sec  0.014 ms  0/763 (0%)
[  4]   5.00-6.00   sec  5.96 MBytes  50.0 Mbits/sec  0.010 ms  0/763 (0%)
[  4]   6.00-7.00   sec  5.95 MBytes  50.0 Mbits/sec  0.015 ms  0/762 (0%)
[  4]   7.00-8.00   sec  5.96 MBytes  50.0 Mbits/sec  0.015 ms  0/763 (0%)
[  4]   8.00-9.00   sec  5.96 MBytes  50.0 Mbits/sec  0.023 ms  0/763 (0%)
[  4]   9.00-10.00  sec  5.95 MBytes  50.1 Mbits/sec  0.011 ms  0/762 (0%)
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Jitter    Lost/Total Datagrams
[  4]   0.00-10.00  sec  60.0 MBytes  50.3 Mbits/sec  0.011 ms  0/7629 (0%)
[  4] Sent 7629 datagrams

iperf Done.
```
________________________________________
- Runs as non-root user
- Small image size
- Small number of layers
- Supports TCP and UDP
- Healthcheck support

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
docker run --name=iperf3 -d --restart=unless-stopped -p 5201:5201/tcp -p 5201:5201/udp mlabbe/iperf3
```
At that point, you can use your Docker server as an iperf3 server to begin testing your network.
