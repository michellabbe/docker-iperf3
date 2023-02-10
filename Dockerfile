FROM alpine:3.17.1

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

HEALTHCHECK --timeout=3s \
 CMD iperf3 -k 1 -c 127.0.0.1 || exit 1

# iperf3 -s = run in Server mode
CMD ["-s"]
