List drives  
`sudo fdisk –l`

Mount drive
`sudo mount /dev/sda1 /mnt`

Set permissions:
```
sudo chmod 775 /mnt
sudo chown -R pi:pi /mnt
```

Mount from boot:  
`sudo nano /etc/fstab`  
Add:  
`/dev/sda1 /mnt ext4 defaults 0 0`

Then reboot