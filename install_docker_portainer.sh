# curl -sSL https://raw.githubusercontent.com/Cerbrus/pi/master/install_docker_portainer.sh | sh

# How To Install Docker and Docker-Compose On Raspberry Pi
# https://dev.to/elalemanyo/how-to-install-docker-and-docker-compose-on-raspberry-pi-1mo

# 1. Update and Upgrade
sudo apt-get update -y && sudo apt-get upgrade -y

# 2. Install Docker
curl -sSL https://get.docker.com | sh

# 3. Add a Non-Root User to the Docker Group
sudo usermod -aG docker ${USER}
groups ${USER}

# 4. Install Docker-Compose
sudo apt-get install libffi-dev libssl-dev -y
sudo apt install python3-dev -y
sudo apt-get install -y python3 python3-pip -y

sudo pip3 install docker-compose

# 5. Enable the Docker system service to start your containers on boot
sudo systemctl enable docker


# Install Portainer with Docker on Linux
# https://docs.portainer.io/start/install/server/docker/linux
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
