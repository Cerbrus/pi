#!/bin/sh -e
# curl -sSL https://raw.githubusercontent.com/Cerbrus/pi/master/sh/install-on-start.sh | sh

GH_FOLDER=https://raw.githubusercontent.com/Cerbrus/pi/master

# prepare dir.
echo 1. Preparing script directory.
mkdir $HOME/sh

# Store webhook
echo 2. Storing webhook.

echo Enter discord webhook url
read WEBHOOK
echo $WEBHOOK > sh/discord-webhook.url

# Download Shell scripts
echo 3. Downloading shell scripts.

sudo wget $GH_FOLDER/sh/on-start.sh $HOME/
sudo wget $GH_FOLDER/sh/discord_webhook_announce.sh $HOME/sh/
sudo chmod +x $HOME/on-start.sh
sudo chmod +x $HOME/sh/on-start.sh

# Install service
echo 3. Downloading and installing on-start service.

sudo wget $GH_FOLDER/services/on-start.service /etc/systemd/system/
sudo systemctl enable on-start.service