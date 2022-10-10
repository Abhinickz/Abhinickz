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
