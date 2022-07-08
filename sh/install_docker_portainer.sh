# curl -sSL https://raw.githubusercontent.com/Cerbrus/pi/master/sh/install_docker_portainer.sh | sh

# Install Docker
curl -sSL https://raw.githubusercontent.com/Cerbrus/pi/master/sh/install_docker.sh | sh

# Install Portainer with Docker on Linux
# https://docs.portainer.io/start/install/server/docker/linux
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
