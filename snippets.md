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
```bash
#   bash: output redirect to file and remove errors from STDERR:
./abhinickz.t 2> /dev/null 1> abhinickz.log
```
```bash
#   bash: redirect STDERR and STDOUT to file:
perl test.pl &> test.log
```
```bash
#   bash: redirect STDOUT and STDERR with tee to another file:
./test.sh 2>&1 | tee -a test.log
```
```bash
#   bash: get contents of binary files:
strings /usr/local/bin/go
```
```bash
#   bash: create file with given modification time:
touch -a -m -t 202207130100.09 fileName.ext
ll fileName.ext
# -rw-r----- 1 abhinickz abhinickz 0 Jul 13 01:00 fileName.ext
stat fileName.ext
#   File: fileName.ext
#   Size: 0               Blocks: 0          IO Block: 4096   regular empty file
# Device: 801h/2049d      Inode: 26372       Links: 1
# Access: (0640/-rw-r-----)  Uid: ( 1000/abhinickz)   Gid: ( 1000/abhinickz)
# Access: 2022-07-13 01:00:09.000000000 +0530
# Modify: 2022-07-13 01:00:09.000000000 +0530
# Change: 2022-07-13 01:46:48.781443006 +0530
#  Birth: -
```
```bash
#   bash: lftp connect:
lftp -e 'debug 10;set ftp:passive-mode off; set ftp:auto-passive-mode no; ls; bye;' -u abhinickz,XXXXXX ftp_server_host
```
```bash
#   bash: download file using multi connection: 8 connection at same time:
aria2c -x8 https://host_name/file
```
```bash
#   bash: follow a pathname until a terminal point is found:
namei -l test.log
# f: test.log
# -rw-r--r-- pi pi test.log
```
```bash
#   bash: solves bind key: CTRL+L clear screen error: old server:
bind -x '"\C-l": clear;';
```
```bash
#   bash: run everyr -n value, default 2s
watch "ls -larth"
# Every 2.0s: ls -larth        dev: Wed Oct  5 21:42:07 2022
# total 28K
# drwxr-xr-x  2 pi pi 4.0K Oct  5 20:37 .
# drwxr-xr-x 37 pi pi 4.0K Oct  5 21:41 ..
```
```bash
#   bash: realtime monitor/do something in realtime.
# Instead of :, you can use sleep 1 (or 0.2) to ease the CPU.
# The loop runs until grep finds the string in the commands output. -m 1 means "one match is enough", i.e. grep stops searching after it finds the first match.
until ps aux | grep -v "auto perl" | grep perl ; do : ; done;
until ps aux | grep -v "auto perl" | grep -m perl ; do : ; done;
```
```bash
#   bash: turn on grep line buffering mode:
tail -f file | grep --line-buffered my_pattern
```
```bash
#   bash: list the file contents of package not installed:
repoquery -l perl
```
```bash
#   bash: check if the package is installed already:
rpm -qa | grep mule
```
```bash
#   bash: yum: check which package contains given dependency.
yum whatprovides libmysqlclient.so.15
```
```bash
#   bash: centos: run command with different User and group:
exec setuidgid mule sg dbusers -c "echo test"
```
```bash
#    bash: kill process by port:
sudo fuser -k 5000/tcp
# 5000/tcp:            10731
# [1]    10731 killed     python3 -m http.server 5000
```
```bash
#    bash: get file full path:
readlink -f test.log
# /home/abhinickz/test/test.log
```
```bash
#    bash: create multilevel directory with pattern:
mkdir -p 2022-0{1,2,3,4,5,6,7,8,9}-{10,15,19,20,21,26,04}
# 2022-01-04 2022-01-21 2022-02-19 2022-03-10 2022-03-26 2022-04-20 2022-05-15 2022-06-04 2022-06-21 2022-07-19 2022-08-10 2022-08-26 2022-09-20
# 2022-01-10 2022-01-26 2022-02-20 2022-03-15 2022-04-04 2022-04-21 2022-05-19 2022-06-10 2022-06-26 2022-07-20 2022-08-15 2022-09-04 2022-09-21
# 2022-01-15 2022-02-04 2022-02-21 2022-03-19 2022-04-10 2022-04-26 2022-05-20 2022-06-15 2022-07-04 2022-07-21 2022-08-19 2022-09-10 2022-09-26
# 2022-01-19 2022-02-10 2022-02-26 2022-03-20 2022-04-15 2022-05-04 2022-05-21 2022-06-19 2022-07-10 2022-07-26 2022-08-20 2022-09-15
# 2022-01-20 2022-02-15 2022-03-04 2022-03-21 2022-04-19 2022-05-10 2022-05-26 2022-06-20 2022-07-15 2022-08-04 2022-08-21 2022-09-19
```
```bash
#    bash: nice trace route:
mtr abhasker_dev_test
# pi (192.168.1.5) -> 192.168.1.69                2022-10-05T21:51:12+0530
# Keys:  Help   Display mode   Restart statistics   Order of fields   quit
#                              Packets               Pings
#  Host                        Loss%   Snt   Last   Avg  Best  Wrst StDev
#  1. abhasker_dev_test        0.0%    15    0.5   0.5   0.4   0.7   0.1
```
```bash
#   bash: create empty socket file:
nc -lkU /tmp/test.sock
# srwxr-xr-x 1 dev   dev      0 Oct  5 22:33 test.sock
```
```bash
#   bash: Check available TLS version:
openssl ciphers -v | awk '{ print $2 }' | sort | uniq
# SSLv3
# TLSv1
# TLSv1.2
# TLSv1.3
```
```bash
#   bash: sqlite: pihole delete arpa results manually:
sudo sqlite3 pihole-FTL.db "DELETE FROM query_storage WHERE domain IN (SELECT id FROM domain_by_id WHERE domain LIKE '%addr.arpa%');"
```
```bash
#   bash: sort numerically:
sort -n file_name
```
```bash
#   bash: sort human readable format in desc order: 1G, 1M, 1K:
sort -hr file_name
```
```bash
#   bash: cvs: steps for creating CVS patch:
cd src/dev_trunk
cvs st file_name
csv diff file_name_1 file_name_2 >> bug_number.patch
```
```bash
#   bash: cvs commit log greater than date:
cvs -z9 log -d > 2003-8-14
```
```bash
# convert m4a to mp3: -q:a 2 (0-9) lower means high quality:
ffmpeg -i ~/input.m4a -c:v copy -c:a libmp3lame -q:a 0 output.mp3
# ffmpeg version 5.1.2 Copyright (c) 2000-2022 the FFmpeg developers
#   built with Apple clang version 14.0.0 (clang-1400.0.29.102)
#   configuration: --prefix=/usr/local/Cellar/ffmpeg/5.1.2 --enable-shared --enable-pthreads --enable-version3 --cc=clang --host-cflags= --host-ldflags= --enable-ffplay --enable-gnutls --enable-gpl --enable-libaom --enable-libbluray --enable-libdav1d --enable-libmp3lame --enable-libopus --enable-librav1e --enable-librist --enable-librubberband --enable-libsnappy --enable-libsrt --enable-libtesseract --enable-libtheora --enable-libvidstab --enable-libvmaf --enable-libvorbis --enable-libvpx --enable-libwebp --enable-libx264 --enable-libx265 --enable-libxml2 --enable-libxvid --enable-lzma --enable-libfontconfig --enable-libfreetype --enable-frei0r --enable-libass --enable-libopencore-amrnb --enable-libopencore-amrwb --enable-libopenjpeg --enable-libspeex --enable-libsoxr --enable-libzmq --enable-libzimg --disable-libjack --disable-indev=jack --enable-videotoolbox
#   libavutil      57. 28.100 / 57. 28.100
#   libavcodec     59. 37.100 / 59. 37.100
#   libavformat    59. 27.100 / 59. 27.100
#   libavdevice    59.  7.100 / 59.  7.100
#   libavfilter     8. 44.100 /  8. 44.100
#   libswscale      6.  7.100 /  6.  7.100
#   libswresample   4.  7.100 /  4.  7.100
#   libpostproc    56.  6.100 / 56.  6.100
# Input #0, mov,mp4,m4a,3gp,3g2,mj2, from '/Users/abhinickz/input.m4a':
#   Metadata:
#     major_brand     : M4A
#     minor_version   : 0
#     compatible_brands: M4A isommp42
#     creation_time   : 2022-10-01T16:44:11.000000Z
#     title           : New Recording
#     voice-memo-uuid : B04D8C3D-8188-43E7-8E91-B5E95A7754E0
#     encoder         : com.apple.VoiceMemos (abhinickz-mac (null))
#   Duration: 00:21:15.40, start: 0.000000, bitrate: 68 kb/s
#   Stream #0:0[0x1](und): Audio: aac (LC) (mp4a / 0x6134706D), 48000 Hz, mono, fltp, 64 kb/s (default)
#     Metadata:
#       creation_time   : 2022-10-01T16:44:11.000000Z
#       handler_name    : Core Media Audio
#       vendor_id       : [0][0][0][0]
# Stream mapping:
#   Stream #0:0 -> #0:0 (aac (native) -> mp3 (libmp3lame))
# Press [q] to stop, [?] for help
# Output #0, mp3, to 'output.mp3':
#   Metadata:
#     major_brand     : M4A
#     minor_version   : 0
#     compatible_brands: M4A isommp42
#     voice-memo-uuid : B04D8C3D-8188-43E7-8E91-B5E95A7754E0
#     TIT2            : New Recording
#     TSSE            : Lavf59.27.100
#   Stream #0:0(und): Audio: mp3, 48000 Hz, mono, fltp (default)
#     Metadata:
#       creation_time   : 2022-10-01T16:44:11.000000Z
#       handler_name    : Core Media Audio
#       vendor_id       : [0][0][0][0]
#       encoder         : Lavc59.37.100 libmp3lame
# size=   19549kB time=00:21:15.45 bitrate= 125.6kbits/s speed= 134x
# video:0kB audio:19549kB subtitle:0kB other streams:0kB global headers:0kB muxing overhead: 0.002113%
```
```bash
#   bash: redis: monitor mode: (password: XXXXXX)
redis-cli -a XXXXXX monitor
```
```bash
#   bash: rsync: flag: -r recursive, -z compress, -P progress, -e execute 'ssh ' due to different ssh port, --delete to delete remote files if local one is deleted:
#   bash: rsync: sync server dir to lcoal without overwrting existing files:
rsync -rvz -e 'ssh -p 5050' --progress --ignore-existing abhinickz@dev:/tmp/test/. /home/abhinickz/test/.
```
```bash
#   bash: rsync: sync local directory to remote host:
rsync -razP --delete -e 'ssh -p 5050' --progress /home/abhinickz/test/. abhinickz@dev:/tmp/test/.
```
```bash
#   bash: git: stop SSL verify:
export GIT_SSL_NO_VERIFY=true
```
```bash
#   git: clone over local network repo:
git clone ssh://test@pi.local:/home/abhinickz/dev_work/
```
```bash
#   git: delete local git branch:
git branch -D branch_name1 branch_name2
# Deleted branch branch_name1 (was ad55dfc).
# Deleted branch branch_name2 (was fd55dfc).
```
```bash
#   git: delete from remote repo:
git push origin --delete branch_name1 branch_name2
# branch_name
# To github.com:Abhinickz/test.git
#  - [deleted]             branch_name1
#  - [deleted]             branch_name2
```
```bash
#   git: pull: rebase branch by pulling the latest changes:
git pull --rebase upstream DEV_BRANCH
```
```bash
#   git: diff: whitespace check: usefull for creating patch without whitespace warnings:
git diff --check
# dev/test.properties:3: trailing whitespace.
# +PROXY_BACKEND = '' 
```
```bash
#   git: diff show modified file name only:
git diff --name-only
# docker-compose.yaml
# docker/nginx/Dockerfile
```
```bash
#   git: diff: show whole stat:
git diff --stat
#  snippets.md | 7 +++++++
#  1 file changed, 7 insertions(+)
```
```bash
#   git: diff: show numerical stat:
git diff --numstat
# 9       0       snippets.md
```
```bash
#   git: diff: show short stat:
git diff --shortstat
#  1 file changed, 10 insertions(+)
```
```bash
#   git: diff: distribution of relative amount of changes for each sub-directory:
git diff --dirstat
#   60.9% docker/pihole/workdir/
#   21.2% docker/pihole/
#    7.8% docker/postgres/workdir/
#    6.4% docker/smokeping/
```
```bash
#   git: diff: show changed file name:
git diff --name-status
# M       snippets.md
```
```bash
#   git: diff show modified lines only:
git diff -U0
# diff --git a/learn_rust_playground/src/main.rs b/learn_rust_playground/src/main.rs
# index f6d0220..c7ae92a 100644
# --- a/learn_rust_playground/src/main.rs
# +++ b/learn_rust_playground/src/main.rs
# @@ -2 +2 @@ fn main() {
# -    println!("test");
# +    print!("test")
```
```bash
#   git: diff: get conflicted file list: that needs to be merged:
git diff --name-only --diff-filter=U
```
```bash
#   git: show git branch created by user:
git for-each-ref --format=' %(authorname) %09 %(refname)'
#  Abhishek Bhasker 	 refs/heads/main
#  Abhishek Bhasker 	 refs/remotes/origin/main
```
```bash
#   git: check repo remote info
git remote show origin
# * remote origin
#   Fetch URL: git@github.com:Abhinickz/Abhinickz.github.io.git
#   Push  URL: git@github.com:Abhinickz/Abhinickz.github.io.git
#   HEAD branch: main
#   Remote branch:
#     main tracked
#   Local ref configured for 'git push':
#     main pushes to main (local out of date)
```