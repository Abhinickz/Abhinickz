```bash
# Linux File System Permissions
# VALUE	            MEANING
# 777	rwxrwxrwx	No restriction, global WRX any user can do anything.
# 755	rwxr-xr-x	Owner has full access, others can read and execute the file.
# 700	rwx------	Owner has full access, no one else has access.
# 666	rw-rw-rw-	All users can read and write but not execute.
# 644	rw-r--r--	Owner can read and write, everyone else can read.
# 600	rw-------	Owner can read and write, everyone else has no access.
```
```bash
# DIRECTORY	        DESCRIPTION
# /	                / also know as “slash” or the root.
# /bin	                Common programs, shared by the system, the system administrator and the users.
# /boot	                Boot files, boot loader (grub), kernels, vmlinuz
# /dev	                Contains references to system devices, files with special properties.
# /etc	                Important system config files.
# /home	                Home directories for system users.
# /lib	                libs and includes files for all kinds of programs needed by the system and the users.
# /lost+found	        Files that were saved during failures are here.
# /mnt	                Standard mount point for external file systems.
# /media	        Mount point for external file systems (on some distros).
# /net	                Standard mount point for entire remote file systems – nfs.
# /opt	                Typically contains extra and third party software.
# /proc	                A virtual file system containing info about system resources.
# /root	                root users home dir.
# /sbin	                Programs for use by the system and the system administrator.
# /tmp	                Temporary space for use by the system, cleaned upon reboot.
# /usr	                Programs, libraries, doc etc. for all user-related programs.
# /var	                Storage for variable/temporary/log/mail/print/webserver/db files.
```
```bash
# DIRECTORY	                    DESCRIPTION
# /etc/passwd	                    Contains local Linux users.
# /etc/shadow	                    Contains local account password hashes.
# /etc/group	                    Contains local account groups.
# /etc/init.d/	                    Contains service init script installed.
# /etc/hostname	                    System hostname.
# /etc/network/interfaces	    Network interfaces.
# /etc/resolv.conf	            System DNS servers.
# /etc/profile	                    System environment variables.
# ~/.ssh/	                    SSH keys.
# /var/log/	                    Linux system log files are typically stored here.
```
```bash
#   bash: list all the commands available:
compgen -c
```
```bash
#   bash: set locale:
export LANGUAGE=en_IN.UTF-8
export LANG=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8
#export LC_ALL=C
sudo locale-gen en_IN.UTF-8
sudo dpkg-reconfigure locales
```
```bash
#   bash: clear iptables Rules: ALLOW ALL TRAFFIC:
iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
iptables -P OUTPUT ACCEPT
iptables -t nat -F
iptables -t mangle -F
iptables -F
iptables -X
```
```bash
#   bash: iptables: check current rules: no rules applied:
iptables -nvL
# Chain INPUT (policy ACCEPT 165 packets, 58308 bytes)
#  pkts bytes target     prot opt in     out     source               destination         
#
# Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
#  pkts bytes target     prot opt in     out     source               destination         
#
# Chain OUTPUT (policy ACCEPT 160 packets, 47183 bytes)
#  pkts bytes target     prot opt in     out     source               destination
```
```bash
#   bash: get all service status at once:
sudo service --status-all
#  [ + ]  cron
#  [ - ]  smokeping
#  [ + ]  udev
#  [ + ]  ufw
#  [ + ]  vnstat
```
```bash
#   bash: stop and remove service from startup:
sudo systemctl disable --now nginx
# Synchronizing state of nginx.service with SysV service script with /lib/systemd/systemd-sysv-install.
# Executing: /lib/systemd/systemd-sysv-install disable nginx
```
```bash
#   bash: remove service from startup:
sudo systemctl mask nginx
# Created symlink /etc/systemd/system/nginx.service -> /dev/null.
```
```bash
#   bash: journalctl: delete old sys logs to speed up boot time:
sudo journalctl --vacuum-size=1G --vacuum-time=7d --vacuum-files=5
# Deleted archived journal /var/log/journal/936/system@6cc-01-0005.journal (16.0M).
# ...
# Vacuuming done, freed 400.0M of archived journals from /var/log/journal/936.
```
```bash
#   bash: ramdisk perfomance check:
sudo dd if=/dev/zero of=/ramdisk/zero bs=4k count=100000
# 100000+0 records in
# 100000+0 records out
# 409600000 bytes (410 MB, 391 MiB) copied, 0.218573 s, 1.9 GB/s
sudo dd if=/ramdisk/zero of=/dev/null bs=4k count=100000
# 100000+0 records in
# 100000+0 records out
# 409600000 bytes (410 MB, 391 MiB) copied, 0.150323 s, 2.7 GB/s
```
```bash
#   bash: check hdd io ping:
ioping -q -c 10 -s 8k .
# --- . (ext4 /dev/sda2 447.8 GiB) ioping statistics ---
# 9 requests completed in 10.9 ms, 72 KiB read, 823 iops, 6.43 MiB/s
# generated 10 requests in 9.00 s, 80 KiB, 1 iops, 8.89 KiB/s
# min/avg/max/mdev = 183.0 us / 1.21 ms / 7.68 ms / 2.31 ms
```
```bash
#   bash: retrieve system hardware related information:
sudo dmidecode 2.9
# System Information
# Manufacturer: LENOVO
# Product Name: XXXXXXXXXX
# Version: ThinkPad L470
# Serial Number: XXXXX
# UUID: XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX
# Wake-up Type: Power Switch
# SKU Number: LENOVO_XX_XXXX_XX_Think_XX_ThinkXad L470
# Family: ThinkPad L470
```
```bash
#    bash: check logged in user:
w
#  21:57:47 up  4:03,  2 users,  load average: 0.15, 0.11, 0.10
# USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
# dev      pts/0    fd23::31:a9c8:36 19:52    1.00s 25.11s  0.01s w
```
```bash
#    bash: check logged in user:
pinky
# Login    Name                 TTY      Idle   When         Where
# dev                           pts/0           Oct  5 19:52 192.168.1.69
# dev                           tty7     04:06  Oct  5 17:55 :0
```
```bash
#   bash: show last logged in users:
last | tail
# abhinickz  ttys000                   Wed Jan 19 23:00 - 23:00  (00:00)
# abhinickz  console                   Wed Jan 19 20:14 - 19:38  (23:24)
# reboot    ~                          Wed Jan 19 20:14
#
# wtmp begins Wed Jan 19 20:14
```
```bash
#   bash: vim: save a read-only file opened in vim: (user with sudo group)
# "test" [readonly] 0L, 0
# -- INSERT -- W10: Warning: Changing a readonly file
:w !sudo tee > /dev/null %
# [sudo] password for abhinickz:
#
# W13: Warning: File "test" has been created after editing started
# [O]K, (L)oad File:
```
```bash
#   bash: vim: map above sudo please (:w!!)
echo 'cmap w!! w !sudo tee > /dev/null %' >> ~/.vimrc
```
```bash
#   bash: search the pacakge with missing file:
apt-file update
apt-file search libxcb.so
# libxcb1: /usr/lib/aarch64-linux-gnu/libxcb.so.1
# libxcb1: /usr/lib/aarch64-linux-gnu/libxcb.so.1.1.0
# libxcb1-dev: /usr/lib/aarch64-linux-gnu/libxcb.so
```
```bash
#   bash: apt: get package based on grep results:
apt search catalyst | awk '{print $1}' | perl -ne '$_ =~ /(.*)\/cosmic,cosmic/; print $1 . "\n" if ($1);' | uniq > catalyst_mod.log
```
```bash
#   bash: apt: pin the package with apt-mark: stop updating the package:
apt-mark hold apache2
# apache2 set on hold.
```
```bash
#   bash: apt update force IPV4 on ubuntu/debian:
sudo apt -o Acquire::ForceIPv4=true update
```
```bash
#   bash: apt proxy settings:
sudo echo 'Acquire::http::Proxy "http://http_ip:8080";' >> /etc/apt/apt.conf
```
