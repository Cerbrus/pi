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

4. Auto Mount:

When you restart your Pi your mounts will be lost and you will need to repeat Step 4. If you want your USB drive to be mounted when the system starts you can edit the fstab file.

First, get the device UUID:
```sh
lsblk -o name,mountpoint,label,size,uuid,fstype
```

```sh
sudo nano /etc/fstab
```
Then add the following line at the end:
```sh
UUID=0e3b3885-2cba-45d1-bad2-c41efd837bd9 /mnt ext4 auto,nofail,noatime,users,rw,uid=pi,gid=pi 0 0
```
The "nofail" option allows the boot process to proceed if the drive is not plugged in.  
The "noatime" option stops the file access time being updated every time a file is read from the USB stick. This helps improve performance.

6. Reboot:
```sh
sudo reboot now
```

- [Mount from `/etc/rc.local`](https://askubuntu.com/questions/822478/external-disk-doesnt-mount-during-boot)
