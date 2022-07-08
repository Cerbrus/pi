#!/bin/sh -e
# curl -sSL https://raw.githubusercontent.com/Cerbrus/pi/master/sh/install-on-start.sh | sh

sudo tee -a on-start.sh > $HOME <<EOT
#!/bin/sh -e

cd $HOME

echo Running startup scripts

exit 0
EOT

sudo chmod -x $HOME/on-start.sh

sudo tee -a on-start.service > /etc/systemd/system <<EOT
[Unit]
Description=Run scripts on start
After=network-online.target

[Service]
Type=simple
User=pi
Group=pi
ExecStart=$HOME/on-start.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOT

sudo systemctl enable on-start.service