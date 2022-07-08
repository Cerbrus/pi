#!/bin/sh -e
# curl -sSL https://raw.githubusercontent.com/Cerbrus/pi/master/sh/install-on-start.sh | sh

GH_FOLDER=https://raw.githubusercontent.com/Cerbrus/pi/master

# prepare dir.
echo 1. Preparing script directory.
mkdir -p $HOME/sh

# Store webhook
echo 2. Storing webhook.

echo Enter discord webhook url
read WEBHOOK
echo $WEBHOOK > sh/discord-webhook.url

# Download Shell scripts
echo 3. Downloading shell scripts.

wget -q $GH_FOLDER/sh/on-start.sh -O $HOME/on-start.sh
wget -q $GH_FOLDER/sh/discord_webhook_announce.sh -O $HOME/sh/discord_webhook_announce.sh
sudo chmod +x $HOME/on-start.sh
sudo chmod +x $HOME/sh/discord_webhook_announce.sh

# Install service
echo 4. Downloading and installing on-start service.

sudo wget -q $GH_FOLDER/services/on-start.service -O /etc/systemd/system/on-start.service
sudo systemctl enable on-start.service
sudo systemctl status on-start.service
