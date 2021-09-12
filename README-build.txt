1) build & push image for each architecture:
server-amd64$ docker build . -t <registry>/system-monitors-amd64:latest
server-amd64$ docker push <registry>/system-monitors-amd64:latest
server-amd64$ docker rmi <registry>/system-monitors-amd64:latest

server-armv7$ docker build . -t <registry>/system-monitors-armv7:latest
server-armv7$ docker push <registry>/system-monitors-armv7:latest
server-armv7$ docker rmi <registry>/system-monitors-armv7:latest

etc...

2) create & push multi-arch manifest
docker manifest create <registry>/system-monitors:latest <registry>/system-monitors-amd64:latest <registry>/system-monitors-armv7:latest
docker manifest push <registry>/system-monitors:latest


3) run
docker run -d --name system_sensors --restart=unless-stopped -v /etc/system_sensors:/etc/config/system_sensors:ro --pid host --network host <registry>/system_sensors:latest
