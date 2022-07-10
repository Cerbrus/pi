<!-- https://www.linuxbabe.com/ubuntu/install-deluge-bittorrent-client-ubuntu-20-04 -->

```sh
sudo apt update && sudo apt upgrade
sudo apt install deluged deluge-web deluge-console python3-mako
```

Generate config files:
```sh
deluged
sudo pkill -i deluged
```
```sh
echo "<USERNAME>:<PASSWORD>:10" >> ~/.config/deluge/auth
```

Start Deluge and enable remote, then start web:
```sh
deluged
deluge-console "config -s allow_remote True"
deluge-web -f
```

Add Deluge service:
```sh
sudo nano /etc/systemd/system/deluged.service
```
```sh
[Unit]
Description=Deluge Daemon
After=network-online.target

[Service]
Type=simple
User=pi
Group=pi
UMask=007
ExecStart=/usr/bin/deluged -d
Restart=on-failure
TimeoutStopSec=300

[Install]
WantedBy=multi-user.target
```
```sh
sudo systemctl enable deluged.service
```

Add WebUi service:
```sh
sudo nano /etc/systemd/system/deluge-web.service
```
```sh
[Unit]
Description=Deluge Web Interface
After=network-online.target deluged.service
Wants=deluged.service

[Service]
Type=simple
User=pi
Group=pi
UMask=027
ExecStart=/usr/bin/deluge-web -d
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
```sh
sudo systemctl enable deluge-web.service
```

```sh
sudo reboot
sudo systemctl status deluged
sudo systemctl status deluge-web
```

Then accessible at:
```none
<ip>:8112
```

Remember to change the default password!
