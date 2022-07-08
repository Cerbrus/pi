#!/bin/sh -e

cd /home/pi/sh

IP=$(curl ifconfig.me)
HOSTNAME=$(hostname)

WEBHOOK=$(cat ./discord-webhook.url)
MESSAGE="A Pi just came online.\n> **Hostname**:\n> $HOSTNAME\n> **IP**:\n> $IP\n"
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"$MESSAGE\"}" $WEBHOOK

exit 0
