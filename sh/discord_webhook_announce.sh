#!/bin/sh -e

cd /home/pi/sh

IP=$(curl ifconfig.me)

IP_L=$(hostname -I)
IP_L=${IP_L%% *}

HOSTNAME=$(hostname)

WEBHOOK=$(cat ./discord-webhook.url)
MESSAGE="A Pi just came online.\n> **Hostname**:\n> \`$HOSTNAME\`\n> **IP**:\n> \`$IP\` (external)\n> \`$IP_L\` (local)\n"
curl -X POST -H "Content-Type: application/json" -d "{\"content\":\"$MESSAGE\"}" $WEBHOOK

exit 0
