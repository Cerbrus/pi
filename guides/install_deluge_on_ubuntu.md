<!-- https://www.linuxbabe.com/ubuntu/install-deluge-bittorrent-client-ubuntu-20-04 -->

```sh
# if necessary: 
# sudo apt install software-properties-common
# sudo add-apt-repository ppa:deluge-team/stable

sudo apt install deluged deluge-web
sudo adduser --system --group deluge
sudo adduser pi deluge
```

Add service:
```sh
sudo nano /etc/systemd/system/deluged.service
```
```sh
[Unit]
Description=Deluge Bittorrent Client Daemon
After=network-online.target

[Service]
Type=simple
User=deluge
Group=deluge
UMask=007
ExecStart=/usr/bin/deluged -d
Restart=on-failure

# Configures the time to wait before service is stopped forcefully.
TimeoutStopSec=300

[Install]
WantedBy=multi-user.target
```
```sh
sudo systemctl restart deluged
sudo systemctl enable deluged
systemctl status deluged
```

Add WebUi:
```sh
sudo nano /etc/systemd/system/deluge-web.service
```
```sh
[Unit]
Description=Deluge Bittorrent Client Web Interface
After=network-online.target

[Service]
Type=simple
User=deluge
Group=deluge
UMask=027
ExecStart=/usr/bin/deluge-web -d
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
```sh
sudo systemctl start deluge-web
sudo systemctl enable deluge-web
systemctl status deluge-web
```

Then accessible at:
```none
<ip>:8112
```

Remember to change the default password!
