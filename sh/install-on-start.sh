#!/bin/sh -e

<<comment
# Run these commands to install the startup script.
echo Enter discord webhook url
read WEBHOOK
echo $WEBHOOK > discord-webhook.url
sudo curl -sSL https://raw.githubusercontent.com/Cerbrus/pi/master/sh/install-on-start.sh | sh
comment

GH_FOLDER=https://raw.githubusercontent.com/Cerbrus/pi/master

# prepare dir.
echo 1. Preparing script directory.
mkdir -p $HOME/sh

# Store webhook
echo 2. Storing webhook.
mv discord-webhook.url sh/discord-webhook.url

# Download Shell scripts
echo 3. Downloading shell scripts.

wget -q $GH_FOLDER/sh/on-start.sh -O $HOME/on-start.sh
wget -q $GH_FOLDER/sh/discord_webhook_announce.sh -O $HOME/sh/discord_webhook_announce.sh
sudo chmod +x $HOME/on-start.sh
sudo chmod +x $HOME/sh/discord_webhook_announce.sh

# Install service
echo 4. Downloading and installing on-start service.

sudo systemctl stop on-start.service
sudo systemctl disable on-start.service
sudo rm /etc/systemd/system/on-start.service

sudo wget -q $GH_FOLDER/services/on-start.service -O /etc/systemd/system/on-start.service
sudo sed -i "s/HOMEDIR/\/home\/$USER/g" /etc/systemd/system/on-start.service

sudo systemctl enable on-start.service
sudo systemctl start on-start.service
sudo systemctl status on-start.service
