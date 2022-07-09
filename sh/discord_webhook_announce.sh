#!/bin/bash -e

cd /home/pi/sh

IP_EXTERNAL=$(curl ifconfig.me)

IP_LOCAL=$(hostname -I)
IP_LOCAL=${IP_LOCAL%% *}

HOSTNAME=$(hostname)
TIMESTAMP=$(date +"_%Y-%m-%d - %T_")
WEBHOOK=$(cat ./discord-webhook.url)

MESSAGE="
$TIMESTAMP
I just came online.
> **Hostname**:
> \`$HOSTNAME\`
> **IP**:
> \`$IP_EXTERNAL\` (external)
> \`$IP_LOCAL\` (local)
"

JSON="{
\"content\":\"${MESSAGE//$'\n'/\\n}\",
\"username\":\"$HOSTNAME\"
}"

curl -X POST -H "Content-Type: application/json" -d "${JSON//$'\n'}" $WEBHOOK

exit 0
