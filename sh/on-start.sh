#!/bin/sh -e

cd /home/pi

echo Running startup scripts

sh /home/pi/sh/discord_webhook_announce.sh

exit 0
