FROM alpine:latest
#FROM alpine:3.6

MAINTAINER Michel Labbe

# build intial apk binary cache and install iperf3
RUN apk --update add iperf3 \
    && rm -rf /var/cache/apk/* \
    && adduser -S iperf

USER iperf
    
# Expose the default iperf3 server port
EXPOSE 5201

# entrypoint allows you to pass your arguments to the container at runtime
# very similar to a binary you would run. For example, in the following
# docker run -it <IMAGE> --help' is like running 'iperf --help'
ENTRYPOINT ["iperf3"]

# iperf3 -s = run in Server mode
CMD ["-s"]
