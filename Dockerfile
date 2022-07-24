FROM alpine:3.16.1

LABEL maintainer="Michel Labbe"

# install iperf3 and create non-root user
RUN apk add --no-cache iperf3 \
  && adduser -S iperf

USER iperf
    
# Expose the default iperf3 server ports
EXPOSE 5201/tcp 5201/udp

# entrypoint allows you to pass your arguments to the container at runtime
# very similar to a binary you would run. For example, in the following
# docker run -it <IMAGE> --help' is like running 'iperf --help'
ENTRYPOINT ["iperf3"]

# Health check floods log window quite a bit.
# If needed you can change/disable health check when starting container.
# See Docker run reference documentation for more information.

# Switched HEALTHCHECK from "1 packet long" to "1 second long" checks as a workaround
# to an issue that appeared in 3.10.1-r0 where speed in reverse mode drops to almost 0 MB/sec 
# after first "1 packet long" test.
# ref: https://github.com/esnet/iperf/issues/1363
# Increased interval from 30 secs to 5 mins to reduce HEALTHCHECK interference on performance tests.
#HEALTHCHECK --timeout=3s \
# CMD iperf3 -k 1 -c 127.0.0.1 || exit 1
HEALTHCHECK --interval=5m --timeout=3s \
  CMD iperf3 -b 1 -t 1 -c 127.0.0.1 || exit 1

# iperf3 -s = run in Server mode
CMD ["-s"]
