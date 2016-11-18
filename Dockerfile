FROM debian:latest
#FROM debian:jessie

MAINTAINER Michel Labbe

RUN apt-get update && apt-get install -y wget \
    && wget https://iperf.fr/download/ubuntu/libiperf0_3.1.3-1_amd64.deb \
         -O /tmp/libiperf0_3.1.3-1_amd64.deb \
    && wget https://iperf.fr/download/ubuntu/iperf3_3.1.3-1_amd64.deb \
         -O /tmp/iperf3_3.1.3-1_amd64.deb \
    && dpkg -i /tmp/libiperf0_3.1.3-1_amd64.deb /tmp/iperf3_3.1.3-1_amd64.deb \
    && rm /tmp/libiperf0_3.1.3-1_amd64.deb /tmp/iperf3_3.1.3-1_amd64.deb \
    && apt-get autoremove -y --purge $BUILD_PACKAGES $(apt-mark showauto) wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -r iperf
    
USER iperf
    
# Expose the default iperf3 server port
EXPOSE 5201

# entrypoint allows you to pass your arguments to the container at runtime
# very similar to a binary you would run. For example, in the following
# docker run -it <IMAGE> --help' is like running 'iperf --help'
ENTRYPOINT ["iperf3"]

# iperf -s = run in Server mode
CMD ["-s"]
