[(format a drive)](https://raspberrytips.com/format-mount-usb-drive/)

1. List drives:
```sh
sudo fdisk –l
```

2. Mount drive:
```sh
sudo mount /dev/sda1 /mnt
```

3. Set permissions:
```sh
sudo chmod 775 /mnt
sudo chown -R pi:pi /mnt
```

4. Mount from boot:
```sh
sudo nano /etc/fstab
# Add:
/dev/sda1 /mnt ext4 defaults 0 0
```

5. Reboot:
```sh
sudo reboot now
```
