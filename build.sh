#/bin/sh

IMAGE_REVISION=${1:-r0}

# Build image
docker build \
    --tag iperf3-test \
    .

ALPINE_RELEASE=$(docker run -it --rm --entrypoint /bin/cat iperf3-test /etc/alpine-release)
IPERF_VERSION=$(docker run -it --rm iperf3-test --version | grep -oP 'iperf \K[0-9]+\.[0-9]+\.[0-9]+')

echo -------------------------
echo Alpine release: $ALPINE_RELEASE
echo Iperf version:  $IPERF_VERSION
echo -------------------------

# Tests
docker network create iperf3-test-network

docker run --restart=unless-stopped --name=iperf3-srv-test --network=iperf3-test-network -d -p 65201:5201 iperf3-test
SERVER_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' iperf3-srv-test)

docker run -it --rm --network=iperf3-test-network iperf3-test -c ${SERVER_IP} -p 5201
RESULT=$?

docker stop iperf3-srv-test
docker rm iperf3-srv-test
docker network rm iperf3-test-network

# Deploy
if [ $RESULT -eq 0 ]; then
    echo "SUCCESS: iperf3 container created."

    docker tag iperf3-test mlabbe/iperf3:latest
    docker tag iperf3-test mlabbe/iperf3:${IPERF_VERSION}-${IMAGE_REVISION}

    docker push mlabbe/iperf3:latest
    docker push mlabbe/iperf3:${IPERF_VERSION}-${IMAGE_REVISION}

    docker rmi iperf3-test
else
    echo "FAILED: Unable to test iperf3 container."
    exit 1
fi
