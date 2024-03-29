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
```bash
#   git: show log in oneline
git log --oneline
# 6f3a223 (origin/master, origin/HEAD, master) added zsh config
# 3dd94e7 Fixed dir alias
# 5398bf4 Added git commit and push alias
```
```bash
#   git: remove 1 last local commit: into stage area:
git reset --soft HEAD~1
# 6f3a223: reomved and file moved to staged area:
```
```bash
#   git: check commit count by author
git shortlog -sn
#     36  Abhinickz
#     31  Abhishek Bhasker
```
```bash
#   git: check config local
git config -l
# core.editor=vim
# core.excludesfile=~/.gitignore_global
# user.name=Abhishek Bhasker
# user.email=abhinickz@dev
```
```bash
#   git: configure email/name config globally:
git config --global user.email "abhinickz@dev"
git config --global user.name "abhinickz"
```
```bash
#   diff: between two files
diff /tmp/file1 /tmp/file2
# 1c1
# < 1
# ---
# > 2
```
```bash
#   git: diff without git repo: any files
git diff --no-index /tmp/file1 /tmp/file2
# diff --git a/tmp/file1 b/tmp/file2
# index d00491f..0cfbf08 100644
# --- a/tmp/file1
# +++ b/tmp/file2
# @@ -1 +1 @@
# -1
# +2
```
```bash
#   git: diff between two commits on github UI:
https://github.com/<username>/<repo_name>/compare/<commit1>...<commit2>
https://github.com/Abhinickz/Abhinickz/compare/3dd94e7056119b19bee7d76c5ef25b7349a5bd6a...6f3a2239c8c9334531e1ddab284e41ef61e867da
```
```bash
#   git: remote stuff:
git remote remove upstream
git remote set-url origin git@github.com:Abhinickz/Abhinickz.git
git remote add upstream git@github.com:Abhinickz/Abhinickz.git
```
```bash
#   git: find parent branch: checkout out from:
git log --pretty=format:'%D' HEAD^ | grep 'origin/' | head -n1 | sed 's@origin/@@' | sed 's@,.*@@'
# test
```
```bash
#   git: PULL request between commits hash:
git log --oneline 49b...edb | grep 'Merge pull request #'
# 869 Merge pull request #13 from abhinickz_dev/test_dev
# r5t Merge pull request #12 from abhinickz_int/test_int
```
```bash
#   git log: search in log history:
#   show commits list where the relevant_string was either added or removed in any .pm file:
git log -Srelevant_string -- *.pm
```
```bash
#   git: diff from commit:
git show --name-only 250fc5ddf1a2f75e4e20430d129a784db4882796
# commit 250fc5ddf1a2f75e4e20430d129a784db4882796 (HEAD -> snippets)
# Author: Abhishek Bhasker <abhinickz@dev>
# Date:   Tue Oct 4 04:31:39 2022 +0530
#
#     WIP: added snippets
#
# snippets.md
```
```bash
#   git: diff from commit:
git show --stat  250fc5ddf1a2f75e4e20430d129a784db4882796
# commit 250fc5ddf1a2f75e4e20430d129a784db4882796 (HEAD -> snippets)
# Author: Abhishek Bhasker <abhinickz@dev>
# Date:   Tue Oct 4 04:31:39 2022 +0530
#
#     WIP: added snippets
#
#  snippets.md | 525 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-------------
#  1 file changed, 482 insertions(+), 43 deletions(-)
```
```bash
#   git: get changed filenames from commit:
git diff-tree --no-commit-id --name-only -r 250fc5ddf1a2f75e4e20430d129a784db4882796
# snippets.md
```
```bash
#   git: diff between two commits for specific file.
git diff 8dc651ab0c2f6812e0522628bc5b8390fa95f634 250fc5ddf1a2f75e4e20430d129a784db4882796 README.md
```
```bash
#   git: Apply git diff:
git apply changes.diff
```
```bash
#  git: revert back git diff:
git apply -R changes.diff
```
```bash
#   git: save stash with name:
git stash save "my_stash"
# Saved working directory and index state On master: my_stash
```
```bash
#   git: all stash:
git stash list
# stash@{0}: On master: my_stash
```
```bash
#   git: stash: apply nth stash and remove it from the stash stack:
git stash pop stash@{n}
# Dropped stash@{0} (de64d256fb15937c28efcea01384264534523153)
```
```bash
#   git: stash: apply a stash and keep it in the stash stack:
git stash apply stash@{n}
```
```bash
#   bash: git: bulk drop stash:
for i in {37..5}; do git stash drop stash@{$i}; done;
# Dropped stash@{37} (147807frythddc397dad0fde124a6be46c6cb968)
# ...
# Dropped stash@{5} (987fvu07dc397dad0fde124a6be46c6cb960998)
```
```bash
#   git: stash: push file with stash_name:
git stash push -m stash_name test/test.pl
# Saved working directory and index state On master: stash_name
```
```bash
#   git: check branches/ref updated in the local repo:
git reflog
# 625e593 (HEAD -> master) HEAD@{0}: reset: moving to HEAD
# 625e593 (HEAD -> master) HEAD@{1}: reset: moving to HEAD
# 625e593 (HEAD -> master) HEAD@{2}: commit (initial): WIP: added snippets
```
```bash
#   git: reset the repo HEAD@{n} before rebase the local branch:
git reset --hard HEAD@{12}
```
```bash
#   git: remote git repo branch and sync on local:
git remote add abhinickz git@github.com:abhinickz/abhinickz.git
git fetch abhinickz
git checkout -b
git reset --hard abhinickz/dev
```
```bash
#   git: blame example:
git blame -L 3,5 -- test.pl
git blame -L 3,+2 -- test.pl
# a4f080fc (Abhishek Bhasker 2022-10-06 01:14:34 +0530  3) use strict;
# a4f080fc (Abhishek Bhasker 2022-10-06 01:14:34 +0530  4)
# a4f080fc (Abhishek Bhasker 2022-10-06 01:14:34 +0530  5) use warnings;
```
```bash
#   tree: check multiple directory structure:
tree tmp/ test/
# tmp
# `-- test.pl
# test
# |-- test.log
# `-- test.pl
```
```bash
#   bash: vim search count:
# n flag makes the :substitute command print the number of matches instead of performing an actual substitution;
# g flag enables reporting of multiple matches per line.
:%s/pattern//ng
# 12 matches on 7 lines
```
```bash
#   bash: vim previous search count:
:%s///gn
# 12 matches on 7 lines
```
```bash
#   bash: vim comment multiple line range: 66 to 70 (inclusive)
:66,70s/^/#
```
```bash
#   bash: vim uncomment multiple line range: 66 to 70 (inclusive)
:66,70s/^#/
```
```bash
#   diff: get diff between dir:
diff --brief -r tmp/ test/
# Only in test: test.log
```
```bash
#   diff: get dir diff files
diff --brief -Nr dir1/ dir2/
# Files tmp/test.log and test/test.log differ
```
```bash
#   diff: between the first n lines of 2 files: works only in bash:
diff < ( head -n 1 /tmp/test1 ) < ( head -n 1 /tmp/test2 )
```
```bash
#   diff: between command and the already written file: "-" gets the standard output here.
echo -e "2\n3" | diff /tmp/test1 -
# 1d0
# < 1
```
```bash
#   bash: script syntax check
bash -n run.sh
```
```bash
# bash: function to load different postgres service/shard
function db() {
    if [ -z "$1" ]
    then
        echo "pass args: app1-shard0 OR app1-shard1 OR app1-shard0";
        . ~/admin-env.sh;
    else
        if [ "$1" == "app1-0" ]
        then
            echo "connecting app1 shard1";
            psql service=db-shard1-app1;
        elif [ "$1" == "app1-1" ]
        then
            echo "connecting app1 shard0";
            psql service=db-shard0-app1;
        else [ "$1" == "app2-sys-0" ]
            echo "connecting app2 shard0";
            psql service=db-shard0-app2;
        fi
    fi
}
```
```bash
#   bash: create symlink:
ln -s source destination
ln -s ~/test/original_file shortcut_here
ln -s -f gcc /usr/bin/gcc
# shortcut_here ->~/test/original_file
```
```bash
#   time of any linux process:
time perl test.pl
# real	0m0.091s
# user	0m0.071s
# sys	0m0.020s
```
```bash
#   bash: creates/updates a database used by locate:
sudo updatedb
```
```bash
#   bash: locate file in current folder:
locate "$(pwd)/*.pl"
```
```bash
#   bash: get unique lines:
sort combined_mapped_metadata.dat | uniq -c
```
```bash
#   bash: get only duplicate lines
sort test_file | uniq -d
```
```bash
#   bash: run sh file:
sh +x do_work.sh
```
```bash
#   bash: shuffle/randomize files content linewise:
shuf test.log
cat test.log | sort -R
```
```bash
#   bash: run a command for a limited time:
timeout 10s ./script.sh
#   bash: restart every 30m:
while true; do timeout 30m ./script.sh; done
```
```bash
#   bash: split long file in files with same number of lines(1):
split -l 2 -d test.pl output_prefix
# output_prefix00  output_prefix01  output_prefix02  output_prefix03  output_prefix04  output_prefix05  output_prefix06  output_prefix07
```
```bash
#   bash: create empty file with given size:
fallocate -l 1G test.img
```
```bash
#   bash: monitor progress in terms of generated output:
#   write random data, encode in base64, monitor progress to /dev/null
# pv options:
#   -l,  lines
#   -b,  total counter
#   -r,  show rate
#   -i2, refresh every 2 seconds
cat /dev/urandom | base64 | pv -lbri2 > /dev/null
# 16.2M [2.03M/s]
```
```bash
#   bash: colorize everything:
locate '' | head -500 | lolcat
```
```bash
#   bash: check color/style support:
for i in {30..37} {40..47} {90..97} {100..107}; do for j in {0..5}; do echo -n " color => \033["$j";"$i"m " ; echo -e "   \033["$j";"$i"m   color testing in BASH \033[0m  "; done; done
```
```bash
#   bash: multiline support with newline and file redirect:
cat > test.txt <<- EOM
Line 1.
Line 2.
EOM
```
```bash
#   bash: tidy xml:
cat filename.xml | tidy -xml -iq
```
```bash
#   bash: bat: hide default number and pager:
bat test.json -pp
```
```bash
#   bash: ld dynamic linking failed debug:
ld -lzlib --verbose
# ==================================================
# attempt to open /usr/x86_64-linux-gnu/lib64/libzlib.so failed
# attempt to open /usr/x86_64-linux-gnu/lib64/libzlib.a failed
# attempt to open /usr/local/lib64/libzlib.so failed
# attempt to open /usr/local/lib64/libzlib.a failed
# attempt to open /lib64/libzlib.so failed
# attempt to open /lib64/libzlib.a failed
# attempt to open /usr/lib64/libzlib.so failed
# attempt to open /usr/lib64/libzlib.a failed
# attempt to open /usr/x86_64-linux-gnu/lib/libzlib.so failed
# attempt to open /usr/x86_64-linux-gnu/lib/libzlib.a failed
# attempt to open /usr/local/lib/libzlib.so failed
# attempt to open /usr/local/lib/libzlib.a failed
# attempt to open /lib/libzlib.so failed
# attempt to open /lib/libzlib.a failed
# attempt to open /usr/lib/libzlib.so failed
# attempt to open /usr/lib/libzlib.a failed
# /usr/bin/ld.bfd.real: cannot find -lzlib
```
```bash
#   bash: wget: get file size only:
wget --spider https://static.crates.io/db-dump.tar.gz
# Spider mode enabled. Check if remote file exists.
# --2022-09-23 12:15:13--  https://static.crates.io/db-dump.tar.gz
# Resolving static.crates.io (static.crates.io)... 13.226.175.48, 13.226.175.94, 13.226.175.127, ...
# Connecting to static.crates.io (static.crates.io)|13.226.175.48|:443... connected.
# HTTP request sent, awaiting response... 200 OK
# Length: 235835914 (225M) [application/gzip]
# Remote file exists.
```
```bash
#   bash: spell: check linux
aspell check --sug-mode=bad-spellers -d en_US file_name.fl
```
```bash
#   bash: spell: check alias for better input:
#   bash: spell: check example:
alias spell='function _spell(){ echo "$1" | aspell -a;};_spell'
spell abhishek
# @(#) International Ispell Version 3.1.20 (but really Aspell 0.60.8)
# & abhishek 7 0: abolished, abolishes, abashed, abashes, abridge, abolish, abash
```
```bash
#   bash: pdf: change PDF file to image file:
convert -geometry 1600x1600 -density 200x200 -quality 100 file.pdf file.jpg
```
```bash
#   bash: image: resize:
convert -resize 150% old.jpg resized.jpg
```
```bash
#   bash: image: change dpi:
convert -units PixelsPerInch old.png -density 300 resized_dpi.png
```
```bash
#   bash: image: convert image to text: ocr (.txt will be appended to text file:)
tesseract source.png destination
tesseract get_file_downloading.png get_file_downloading
```
```bash
#   pdf: combine multiple PDF:
pdftk file1.pdf file2.pdf cat output output.pdf
```
```bash
#   pdf: get pdf information:
pdfinfo test.pdf
pdfinfo test.pdf | grep -i Pages:
```
```bash
#   bash: ssh: generate new ssh key:
ssh-keygen -t rsa -b 4096 -C "abhinickz@test.dev" -a 5
# Generating public/private rsa key pair.
# Enter file in which to save the key (/home/abhinickz/.ssh/id_rsa): /home/abhinickz/.ssh/dev_id_rsa
# Enter passphrase (empty for no passphrase):
# Enter same passphrase again:
# Your identification has been saved in /home/abhinickz/.ssh/dev_id_rsa
# Your public key has been saved in /home/abhinickz/.ssh/dev_id_rsa.pub
# The key fingerprint is:
# ...
# ...
# +---[RSA 4096]----+
# | o= .........    |
# +----[SHA256]-----+
```
```bash
#   bash: start ssh agent:
eval "$(ssh-agent -s)"
# Agent pid 30690
```
```bash
#   bash: add the above generated keys to ssh agent:
ssh-add ~/.ssh/dev_id_rsa
# Enter passphrase for /home/abhinickz/.ssh/dev_id_rsa:
# Identity added: /home/abhinickz/.ssh/dev_id_rsa (abhinickz@test.dev)
```
```bash
#   bash: git: check ssh status/keys from github:
ssh -T git@github.com
# Hi Abhinickz! You've successfully authenticated, but GitHub does not provide shell access.
```
```bash
#   bash: ssh: copy ssh key to remote:
ssh-copy-id -f -i ~/.ssh/dev_id_rsa abhinickz@dev
# /usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/home/abhinickz/.ssh/dev.pub"
#
# Number of key(s) added:        1
#
# Now try logging into the machine, with:   "ssh abhinickz@dev"
# and check to make sure that only the key(s) you wanted were added.
```
```bash
#   bash: check/verify ssh key passphrase:
ssh-keygen -y
# Enter file in which the key is (/home/abhinickz/.ssh/dev): /home/abhinickz/.ssh/dev.pub
# Enter passphrase:
# ssh-rsa KEYSFORMAT== abhinickz@dev
```
```bash
#   bash: find given directory size:
du -sh ./test/
# 12K	./test/
```
```bash
#   bash: get the hidden dir size info:
ls -aF -1 ~/. | rg '^\.\w+/' | xargs du -sh
# 1.7G	.cache/
# 1.3G	.cargo/
```
```bash
#   awk: print if column length is 6.
awk 'BEGIN{FS="\t"}{ if(NF==6) {print $n}}' test.log
```
```bash
#   awk: get unique lines:
awk '!seen[$0]++' ~/.bash_history > /tmp/bash_history
```
```bash
#   awk: different field seperator:
awk '{FS=","} {print $1}' test.log
```
```bash
#   bash: remove Duplicate lines using awk
for i in 1 2 3 4 5 6 7 8 9 ; do echo $PATH >> /tmp/remove_duplicate_lines.log ; done
awk '!x[$0]++' /tmp/remove_duplicate_lines.log
# ABC
```
```bash
#   awk docs.
# NR==FNR : NR is the current input line number and FNR the current file line number. The two will be equal only while the 1st file is being read.
```
```bash
#   Remove Apache Server SSL Mutex Error:
ipcs -s  | awk ' { print $2 } ' | grep '[0-9]' | xargs -n 1 ipcrm -s
```
```bash
#   bash: get linux hostname:
hostname -f
# test.dev
```
```bash
#   bash: count unique word space seperated
echo "1 2" | tr " " "\n" | uniq | wc -l
```
```bash
#   bash: prepend line number:
echo -e "A\nB" | nl
#  1	A
#  2	B
```
```bash
#   bash: ?
echo dev | tr 'abcdefghijklmnopqrstuvwxyz_' '0123456789012345678901234567' | cut -c 2-6 | sed "s/^/1/"
# 141
```
```bash
#   bash: random string:
tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' < /dev/urandom | head -c 67  ; echo
# h45u|QM6_&33xO#90wp*(ehJS!I5;G`K;a-JPDPVc0`{V%)1(SMko}{r3)mQ*OPv0[`
```
```bash
#   bash: combine two linux command output with new line:
echo $(ps aux | head -1)$'\n'$(ps auxf | tail -1)
# USER PID %CPU %MEM VSZ RSS TTY STAT START TIME COMMAND
# test 89751 0.1 0.2 157084 18452 ? Sl Oct03 0:17 ./test.pl
```
```bash
#   bash: count logged in users:
users | tr " " "\n" | uniq
```
```bash
#   source dir copied from dev server to the local current folder:
scp -r abhinickz@dev:/home/abhinickz/source .
```
```bash
#   split file:
split -l 500000 Archived_Doc_Data.text moveFile
counter=1; for file in moveFile* ; do mv "$file" "moveFile$((counter++)).txt" ; done
```
```bash
#   opensuse:?
#   create new screen abhinickz_dev
screen create abhinickz_dev
```
```bash
#   detach running screen: in background
#   CTRL a then press only d to detach
#   reconnect to background detached screen
screen reconnect abhinickz_dev
```
```bash
#   CTRL d to terminate Screen.
Alt+d opposite of CTRL+w
```
```bash
#   create screen named session:
screen -S abhinickz_dev
```
```bash
# List Screen runnign sessions:
screen -r
# There are several suitable screens on:
#         19275.abhinickz_dev (Detached)
#         18895.abhinickz_int (Detached)
# Type "screen [-d] -r [pid.]tty.host" to resume one of them.
```
```bash
#   List Screen runnign sessions:
screen -r 19275.abhinickz_dev
```
```bash
#   Get permission in Octal Format:
stat -c "%A %a %n %U" test.pl
# -rw-r--r-- 644 test.pl pi
```
```bash
#   bash: loop example
for i in {1..2}; do echo -e 'test1\ttest\ttest\ttest\ttest' >> test.log; done; head test.log
# test1	test	test	test	test
# test1	test	test	test	test
```
```bash
#   bash: run multiple sql file in db db_name:
for file in `ls sql/*`; do psql db_name -f $file; done;
```
```bash
#   bash: first line from the file:?
for i in `csv_filename.txt` ; do '$i' | head -1 $i >> txt_file_header.txt; done;
```
```bash
#   find: head: read 1st line from every file:
find ./DATA -type f | xargs head -1 >> header_first_line.log
```
```bash
#   find: xargs: deals with space in filename, basically change the default delimiter 
find ./CDATA -type f | xargs -d '\n' chmod o-w
find ./CDATA -type f | xargs -0 head -1 >> header_first_line.log
```
```bash
#   find: all mp3 files recursively
find -type f -iname "*.mp3"
find ./CDATA -name "*.pl" -exec cygpath -awp {} \;
```
```bash
#   find: unique file extension in given dir: using perl
find ./CDATA/ -type f | perl -ne 'print $1 if m/\.([^.\/]+)$/' | sort -u
```
```bash
#   find: multiple files & print only file basenames with perl.
find ./ -name "*.avi" -o -name "*mp4" -o -name "*.mkv"  | perl -ne 'print $2."\n" if ( $_ =~ m/(.*)\/(.*)/); '
```
```bash
#   find: prints file name type recursively:
find . -printf '%p\t' -exec file -bi {} \;
# .	inode/directory; charset=binary
# ./test.log	text/plain; charset=us-ascii
# ./test.pl	inode/x-empty; charset=binary
```
```bash
#   find: files with double quotes around it:
find ./  -type f -printf "\"%p\"\n"
```
```bash
#   find: and display number of lines:
find . -type f -exec wc -l {} +
```
```bash
#   find: with grep return filename(-H flag) with line number:
find ./ -type f -exec grep -inH 'ds.test.com' {} \;
```
```bash
#   find: files only in level 1 folder:(search files in current folder only.):
find ./ -maxdepth 1 -type f
```
```bash
#   find: creates dir based on files name:
find -maxdepth 1 -type f | sed 's/\.\///g' | sed 's/\..*$//g' |  sed "s/^/'/g" | sed "s/$/'/g" | xargs mkdir
```
```bash
#   find: excluding .git files!
find ./ -name .git -prune -o -type f -exec grep -inH 'home.html' {} \;
```
```bash
#   find: with Multiple pattern.
find ./ -type f -name '*.pm' -o -name '*.pl' | grep -v '.svn' | xargs grep -i 'final_session_id\|formid'
```
```bash
#   find: files newer than logindb.txt created time.
find ./ -type f -newer logindb.txt
```
```bash
#   find: change Permission recursively:
find ./ -type f -exec chmod 600 {} \;
```
```bash
#   find: recursivley folder wise file count:
find ./test/ -type d | sort | while read -r dir; do n=$(find "$dir" -type f | wc -l); printf "%4d : %s\n" $n "$dir"; done
#    2 : ./test/
```
```bash
#   find: get files name only where "purge" is not written: -L: only file name:
find ./test/ -name "*.pl" -exec grep -il 'CREATE TABLE' {} \; | xargs grep -iL 'purge' > file_not_purge_table.txt
```
```bash
#   find: examples with size
find . -type 'f' -size +1024k -exec wc -l {} \;
find . -type 'f' -size +1024k | xargs truncate --size 0
find . -type 'f' -size +1024k -delete
```
```bash
#    find: excludes file type:xw
find -name .svn -prune -o \
 -type f \( -name \*.pm -o -name \*.html -o -name \*.cgi -o -name \*.pl -o -name \*.t -o -name \*.psgi \) \
 -exec grep "Add\ To\ Cart" {} +
```
```bash
#   find: delete file by node: 15518483
find . -inum 15518483 -delete
```
```bash
#   bash: list file by inode: 403598
ls -li
# 403598 -rw-r--r-- 1 dev dev   5 Oct  2 23:27 test.log
```
```bash
#   tr: andle space:
cat SELECT_queries_check.txt | tr -s [:space:] [:space:]
```
```bash
#   remove filename headers from file without opening the file.
sed 's/^1|//g' exceldata.txt > xls_data.txt
```
```bash
#   sed: makes both changes in the single file named file, in-place. Without a backup file
sed -i -e 's/a/b/g' -e 's/b/d/g' file
```
```bash
#   sed: dir path WINDOWS style.
echo $(pwd) | sed 's/\//\\/g'
# \home\abhinickz\test
```
```bash
#   sed: -I - not match binary file:
#   sed -i '' : The BSD sed command takes the -i option but requires a suffix for the backup (but an empty suffix is permitted).
grep -I -ril -e '\[% INCLUDE page_elements\/forms\/dbl_submit_token.tt \%]' | xargs sed -i '' 's/\[% INCLUDE page_elements\/forms\/dbl_submit_token.tt \%]//'
```
```bash
#   sed: removes the whole matched line:
grep -I -ril -e '\[% INCLUDE page_elements\/forms\/dbl_submit_token.tt \%]' | xargs sed -i '' 's/ *\[% INCLUDE page_elements\/forms\/dbl_submit_token.tt \%]/d'
```
```bash
#   sed: handle files name with wierd character:
# filename with quotes:
find ./ | sed 's/'"'"'/\'"'"'/g' | sed 's/.*/"&"/'
# "./"
# "./test.log"
# "./test.pl"
```
```bash
#   sed: handle file name with space:
find ./CDATA/ -type f | sed 's/ /\\ /g' | sed 's/(/\\(/g' | sed 's/)/\\)/g'
# ./abc\ test\ 1080
# ll ./abc\ test\ 1080
```
```bash
#   sed: get/print only nth/5th line
cat test.pl | sed -n '5 p'
# use warnings;
```
```bash
#   sed: remove m/nth line:
sed -i '2d;4d' file_name
```
```bash
#   grep date range: fetch data within OCT-NOV date range.
grep -E '2017-1[0-1]-[0-3][0-9]' dev_stats.csv > dev_stats_date_range.csv
```
```bash
#   grep: exclude hidden files:
grep -v '\/\.'
```
```bash
#   grep color option:
grep --color=auto 'search_this' in_this_file.log
```
```bash
#   grep: content and print both above and below 1 line:
grep -C 1 -i 'found' test.pl
```
```bash
#   grep: pick grep pattern from the file
grep -F pick_word_from_file search_in_this_file
```
```bash
#   grep hide grep process : [p] is a trick to stop you picking up the actual grep process itself.
ps axuf | grep '[s]leep'
```
```bash
#   grep AND example
ps aux | grep -Ei 'script.*abhinickz'	#	E flag for giving pattern regex.
# pi         19366  2.5  0.6 1123452 49380 ?       Sl   Oct01  48:21          \_ script --profile LXDE-abhinickz
```
```bash
#   bash: grep: rg: get file name from patch:
rg 'diff --git' patch.diff | sed 's/diff --git a\///g' | awk '{print $1}'
# test.pl
# test.log
```
```bash
#   bash: grep: rg: search foo and ignore bar directory:
rg foo -g '!bar/'
```
```bash
#   bash: grep: rg: first match and exit:
rg -m 1 SELECT test.sql
# 4:SELECT
```
```bash
#   grep OR example
ps aux | grep 'abhinickz\|bhasker'
```
```bash
#   bash: convert grep awk to awk:
# awk and grep both at the same time:
cat test | grep 'test' | awk 'BEGIN{ FS=","}{print $1}'
cat test | awk 'BEGIN{ FS=","}/test/{ print $1 }'
```
```bash
#   cut: get columns field only with delimiter(:) f1 => first field.
# test:x:4:634:test:/bin:/bin/test
# dev:x:4:634:dev:/bin:/bin/dev
$ cut -d':' -f1 /tmp/data.log
# test
# dev
```
```bash
#   bash: get only 42 chars from each line:
locate dev/test/ | cut -c 1-42 | uniq
```
```bash
#   tar: list content without extracting:
tar -tf true.tar.gz
# true-v1.0.2/
# true-v1.0.2/LICENSE.md
```
```bash
#   tar: extract true.tar.gz:
tar -xvzf true.tar.gz
```
```bash
#   .bz2: extract bz2 file:
bzip2 -d test.bz2
```
```bash
#   create ompressed bz2 file: -k keep the original file:
bzip2 -k test.log
```
```bash
#   unzip .7z files maintaining dir structure:
7z x ./OMDATA/AXSOne_Priority1_Phase1_AHP.7z
```
```bash
#   unzip: .zip files maintaining dir structure:
$ unzip ./OMDATA/AXSOne_Priority1_Phase1_AHP.zip -d ./
```
```bash
#   bash: get formatted date:
date +"%Y_%m_%d"
# 2022_10_04
```
```bash
#   bash: epoch to date:
date -d @1234567890
# Sat Feb 14 05:01:30 IST 2009
```
```bash
#   bash: date time example
echo $(date '+%Y-%m-%d %r') "<=>" $(date -d '+1 hour' '+%Y-%m-%d %r')
# 2022-10-03 12:14:49 AM <=> 2022-10-03 01:14:49 AM
echo $(date '+%Y-%m-%d %I:%M %p') "<=>" $(date -d '+1 hour' '+%Y-%m-%d %I:%M %p')
# 2022-10-03 12:15 AM <=> 2022-10-03 01:15 AM
```
```bash
#   bash: patch file with date:
echo DEV_$(date '+%Y%m%d%H%M').patch
# DEV_202210030017.patch
```
```bash
#   bash: interpret as ' single quote:
echo test''"'"''test
# test'test
```
```bash
#   bash: glob pattern: hidden/regular files:
echo * # all (only regular)
# a
echo .* # all (only hidden)
# .a ..a
```
```bash
#   bash: echo newline example:
echo "test1 test2"$'\n'"test3 test4"
```
```bash
# test1 test2
# test3 test4
```
```bash
#   bash: echo render special character like newline \n \r
echo -e "Line1\nLine2"
# Line1
# Line2
```
```bash
#   bash: ps output info:
ps auxf
# USER       PID  %CPU %MEM  VSZ RSS     TTY   STAT START   TIME COMMAND
# timtty   29217  0.0  0.0 11916 4560 pts/21   S+   08:15   0:00 test  
# root     29505  0.0  0.0 38196 2728 ?        Ss   Mar07   0:00 sshd: can [priv]
# can      29529  0.0  0.0 38332 1904 ?        S    Mar07   0:00 sshd: can@notty
# USER = user owning the process
# PID = process ID of the process
# %CPU = It is the CPU time used divided by the time the process has been running.
# %MEM = ratio of the process’s resident set size to the physical memory on the machine
# VSZ = virtual memory usage of entire process (in KiB)
# RSS = resident set size, the non-swapped physical memory that a task has used (in KiB)
# TTY = controlling tty (terminal)
# STAT = multi-character process state
# START = starting time or date of the process
# TIME = cumulative CPU time
# COMMAND = command with all its arguments
```
```bash
#   ps aux: check pid running process:
ps -fp 1
# UID   PID    PPID  C STIME TTY      TIME CMD
# root    1       0  0 21:15 ?    00:00:01 /sbin/init splash
```
```bash
#   ps aux: check pid process directly started by given pid
ps -f --ppid 1
# UID   PID    PPID  C STIME TTY      TIME CMD
# root  334       1  0 21:16 ?    00:00:01 /lib/systemd/systemd-journald
# root  408       1  0 21:16 ?    00:00:05 /lib/systemd/systemd-udevd
```
```bash
#   ps aux: sort by cpu:
ps aux --sort=-pcpu | head -2
# USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
# pi         19366  2.5  0.6 1123452 49380 ?       Sl   Oct01  48:18 lxpanel --profile LXDE-pi
```
```bash
#   ps aux: sort by memory:
ps aux --sort -rss | head -2
# USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
# root       17137  0.4  1.2 340476 100892 tty7    Ssl+ Oct01   9:25 /usr/lib/xorg/Xorg :0 -seat seat0 -auth /var/run/lightdm/root/:0 -nolisten tcp vt7 -novtswitch
```
```bash
#   ps aux: find zombie process:
ps axo pid=,stat= | awk '$2~/^Z/ { print }'
```
```bash
#   ps aux: show threads:
ps -e -T | grep process_name
```
```bash
#   bash: IO: check active process:
iotop -ao
# Total DISK READ: 31.22 K/s | Total DISK WRITE: 27.31 K/s
#   TID  PRIO  USER     DISK READ  DISK WRITE  SWAPIN     IO>    COMMAND
# 13581 be/4 root        273.50 K    116.00 K  0.00 %  0.10 % perl test.pl
```
```bash
#   man command:
# 1      User Commands
# 2      System Calls
# 3      C Library Functions
# 4      Devices and Special Files
# 5      File Formats and Conventions
# 6      Games et. al.1      User Commands
# 2      System Calls
# 3      C Library Functions
# 4      Devices and Special Files
# 5      File Formats and Conventions
# 6      Games et. al.
# 7      Miscellanea
# 8      System Admi
# 7      Miscellanea
# 8      System Administration tools and Daemons
man 1 printf
man 2 printf
# No manual entry for printf in section 2
man 3 printf
man -a printf
```
```bash
#   bash: docker: commit a container:
docker commit container_name/id running_container_image
# f5283438590d
```
```bash
#   bash: docker: images formatted information:
$ docker images -a --format='{{json .}}' | jq
# {
#   "Containers": "N/A",
#   "CreatedAt": "2022-09-24 20:03:28 +0530 IST",
#   "CreatedSince": "3 years ago",
#   "Digest": "<none>",
#   "ID": "sad878fds8",
#   "Repository": "dev-images-postgres",
#   "SharedSize": "N/A",
#   "Size": "212MB",
#   "Tag": "latest",
#   "UniqueSize": "N/A",
#   "VirtualSize": "211.8MB"
# }
```
```bash
#   bash: docker: images formatted information with given fields:
docker image list --format "table {{.ID}}\t{{.Repository}}\t{{.Tag}}\t{{.Size}}\t{{.CreatedAt}}"
# 5e378031d472    memcached    1.5-alpine      8.9MB      2020-02-06 08:42:24 +0530 IST
# 35b0e5135df0    openjdk      8-jre-alpine    83.4MB     2019-05-18 04:22:40 +0530 IST
```
```bash
#   bash: docker: container formatted information:
docker container ls --format='{{json .}}' | jq
# {
#   "Command": "\"docker-entrypoint.s…\"",
#   "CreatedAt": "2021-12-09 12:18:18 +0530 IST",
#   "ID": "3722bac8aa65",
#   "Image": "memcached:1.5-alpine",
#   "Labels": "com.docker.compose.image=sha256:5e378com.docker.compose.version=2.2.1",
#   "LocalVolumes": "0",
#   "Mounts": "",
#   "Names": "memcached",
#   "Networks": "docker-dev_default",
#   "Ports": "11211/tcp",
#   "RunningFor": "10 hours ago",
#   "Size": "0B (virtual 8.9MB)",
#   "State": "running",
#   "Status": "Up 10 hours"
# }
```
```bash
#   bash: docker: push image to registry:
docker push abhinickz/ubuntu_dev_21_10:firsttry
# The push refers to repository [docker.io/abhinickz/ubuntu_dev_21_10]
# 2c3ddd1f0489: Pushing [========>]  1.337GB/7.498GB
# 437e3e69fe53: Mounted from library/ubuntu
# firsttry: digest: sha256:b793 size: 743
```
```bash
#   bash: docker: stop postgres docker gracefully:
# USER         PID %CPU %MEM    VSZ   RSS TTY  STAT START   TIME COMMAND
# postgres      11  0.0  0.6 5472604 157372 ?  S    21:05   0:02 postgres -c logging_collector=on -c log_directory=/logs -c log_filename=postgresql.log -c log_statement=all
kill -s TERM 11
# 2022-09-23 08:03:28.153 IST>[1]::[] [] LOG:  received smart shutdown request
```
```bash
#   bash: mosquitto: Start mqtt broker server:
mosquitto -v
```
```bash
#   bash: mosquitto mqtt client subscribe to this topic: 'mqtt test abhinickz'
mqtt sub -t 'mqtt test abhinickz' -h 'localhost' -v
```
```bash
#   bash: mosquitto: mqtt client publish to this topic: 'mqtt test abhinickz'
mosquitto_pub -t 'mqtt test abhinickz' -m 'hello world1'
```
```bash
#    bash: mosquitto: Multiple topics:
mqtt sub -t 'test' -t 'test2' -m 'hello world1'
```
```bash
#    bash: mosquitto: sub with manual id:
mqtt sub --id 'unique_id_abhinickz' -t 'test'  -h 'localhost' -v
```
```bash
#   bash: parallel: run multiple sql file: parallel_1.sql parallel_2.sql
parallel \psql -q -h 0.0.0.0 -U abhinickz -d dev_test -a -q -f parallel_{}.sql ::: 1 2
```
```bash
#   bash: pg_restore: restore with custom compressed dump file format:
pg_restore -j 8 -d db_name data_dump.c.sql
```
```bash
#   bash: pg_dump: backup with custom compressed file format:
pg_dump -Fc db_name > data_dump.c.sql
```
```bash
#   bash: pg_restore: restore with custom compressed dump file format
pg_restore -d db_name --no-owner --no-privileges --no-tablespaces --clean --schema public "data_dump.sql"
```
```bash
#   bash: psql: copy table from one host to another:
pg_dump -h host1 -t yourtable database1 | psql -d database2 -h host2
```
```bash
#   bash: psql: copy from server to local:
pg_dump -h host_name -t table_name db_name > ~/table_data.sql
```
```bash
#   bash: psql: dump whole schema:
pg_dump -t table_name db_name > ~/table_schema.sql
```
```bash
#   bash: psql: only dump insert data sql file:
pg_dump --column-inserts --data-only -t table_name db_name > ~/table_data_insert.sql
```
```bash
#   bash: psql: redirect to local psql host:
cat ~/table_data.sql | psql -d db_name
```
```bash
#   bash: psql: run sql from file:
psql -U user_name -d db_name -f test/load_data.sql
```
```bash
#   bash: pgbench: initialize schema:
pgbench -h 0.0.0.0 -U abhinickz -d test -p 5432 -i
```
```bash
#   bash: pgbench: run postgres benchmark:
# -c => client
# -T => time in seconds
# -S => Use only SELECT operation
# -n => Skip vacuuming on tables
# -j => number of threads (default: 1)
pgbench -h 0.0.0.0 -U abhinickz -d test -p 5432 -c 100 -T 300 -S -n -j 4
```
```bash
#   bash: pgbadger: postgres log analysis: pgbadger will create out.html If LOG: Ok
pgbadger -j 4 --prefix '%m [%p] [%r] [%a] %q%u@%d ' postgresql_2021_02_11.log
# [======================>  ] Parsed 1665758048 bytes of 1761595826 (94.56%), queries: 578233996, events: 1146
# LOG: Ok, generating html report...
```
```bash
#   bash: psql: export all db tables to csv files
SCHEMA="public"
DB="dev_data"
psql -Atc "select tablename from pg_tables where schemaname='$SCHEMA'" $DB |\
  while read TBL; do
    psql -c "COPY $SCHEMA.$TBL TO STDOUT WITH CSV" $DB > $TBL.csv
  done
```
```bash
#   bash: pgtop: check postgres process:
# for remote: flag -r or --remote-mode
# and pg_proctab extension installed on the host 
pg_top -r -h host_name -p 5433 -d db_name
```
```bash
#   Minute      Hour        Day of Month    Month               Day of Week         Command
#   (0-59)      (0-23)      (1-31)          (1-12 or Jan-Dec)   (0-6 or Sun-Sat)    perl script.pl
#   cronjob run at 9 AM everyday.
0 9 * * *
#   cronjob run at 7 AM everyday.
0 7 * * 1
```
```bash
#   perl: install locally downloaded module:
tar zxf Digest-SHA1-2.13.tar.gz
cd Digest-SHA1-2.13
perl Makefile.PL
make
make test           # skip it if test is failing due to some admin rights!
make install
```
```bash
#   perl: perltidy: format and modify test.pl and backup the originals to test.pl.bak 
perltidy -b -bext='/' test.pl
```
```bash
#   perl: get module installed path:
perldoc -l Data::Dumper
# /usr/lib/aarch64-linux-gnu/perl/5.32/Data/Dumper.pm
```
```bash
#   perl: corelist modules changes according to perl version:
corelist --diff 5.32.0 5.32.1
# B::Op_private                         5.032000   5.032001
# Config                                   5.032   5.032001
# Data::Dumper                             2.174   2.174_01
# DynaLoader                                1.47    1.47_01
# ExtUtils::Liblist::Kid                    7.44    7.44_01
# Module::CoreList                    5.20200620 5.20210123
# Module::CoreList::Utils             5.20200620 5.20210123
# Opcode                                    1.47       1.48
# Safe                                      2.41    2.41_01
# Win32API::File::inc::ExtUtils::Myconst2perl   (absent)          1
```
```bash
#   perl: print module path/version/installed
cpan -D Term::ReadLine::Perl
# Reading '/home/abhinickz/.cpan/Metadata'
# 	Database was generated on Tue, 18 Dec 2018 10:41:03 GMT
# Term::ReadLine::Perl
# -------------------------------------------------------------------------
# 	(no description)
# 	I/IL/ILYAZ/modules/Term-ReadLine-Perl-1.0303.tar.gz
# 	/usr/local/share/perl/5.26.2/Term/ReadLine/Perl.pm
# 	Installed: 1.0303
# 	CPAN:      1.0303  up to date
# 	Ilya Zakharevich (ILYAZ)
# 	cpan@ilyaz.org
```
```bash
#   perl: cpan: upgrade all CPAN modules:
cpan upgrade /(.*)/
```
```bash
#   perl: cpan: force module install without running test:
cpan -T install Term::ReadLine::Perl
```
```bash
#   perl: cpan: configure proxy settings:
o conf init /proxy/
ftp://http_ip:8080
ftp://https_ip:80
http://http_ip:8080
http://https_ip:80
o conf commit
```
```bash
#   perl: cpan: sudo cpan failes with permission error:
o conf make_install_make_command 'sudo make'
```
```bash
#   perl: cpan: no access for /usr/bin change dir to /usr/local/bin
o conf makepl_arg "INSTALLBIN=/usr/local/bin INSTALLSCRIPT=/usr/local/bin"
o conf commit
```
```bash
#   perl: prove: unit testing parallel:
prove -r -j 8 t/
```
```bash
#   perl: get @INC:
#   awk: get all records after some regexp(INC:):
perl -V | awk 'f;/INC:/{f=1}'
#    /etc/perl
#    /usr/local/lib/aarch64-linux-gnu/perl/5.32.1
#    /usr/local/share/perl/5.32.1
#    /usr/lib/aarch64-linux-gnu/perl5/5.32
#    /usr/share/perl5
#    /usr/lib/aarch64-linux-gnu/perl-base
#    /usr/lib/aarch64-linux-gnu/perl/5.32
#    /usr/share/perl/5.32
#    /usr/local/lib/site_perl
```
```bash
#   perl: get @INC:
perl -e 'use strict; use warnings; use Data::Dumper; print Dumper(\@INC);'
# $VAR1 = [
#     '/etc/perl',
#     '/usr/local/lib/x86_64-linux-gnu/perl/5.22.1',
#     '/usr/local/share/perl/5.22.1',
#     '/usr/lib/x86_64-linux-gnu/perl5/5.22',
#     '/usr/share/perl5',
#     '/usr/lib/x86_64-linux-gnu/perl/5.22',
#     '/usr/share/perl/5.22',
#     '/usr/local/lib/site_perl',
#     '/usr/lib/x86_64-linux-gnu/perl-base',
# ];
```
```bash
#   perl: get %INC:
perl -e 'use strict; use warnings; use Data::Dumper; print Dumper(\%INC);'
# $VAR1 = {
#     'constant.pm' => '/usr/share/perl/5.22/constant.pm',
#     'overload.pm' => '/usr/share/perl/5.22/overload.pm',
#     'Carp.pm' => '/usr/local/share/perl/5.22.1/Carp.pm',
#     'bytes.pm' => '/usr/share/perl/5.22/bytes.pm',
#     'Exporter.pm' => '/usr/share/perl/5.22/Exporter.pm',
#     'warnings/register.pm' => '/usr/share/perl/5.22/warnings/register.pm',
#     'XSLoader.pm' => '/usr/local/lib/x86_64-linux-gnu/perl/5.22.1/XSLoader.pm',
#     'Data/Dumper.pm' => '/usr/lib/x86_64-linux-gnu/perl/5.22/Data/Dumper.pm',
#     'warnings.pm' => '/usr/share/perl/5.22/warnings.pm',
#     'strict.pm' => '/usr/share/perl/5.22/strict.pm',
#     'overloading.pm' => '/usr/share/perl/5.22/overloading.pm'
# };
```
```bash
#   perl oneliner: get user info:
perl -e 'use strict; use warnings; use Data::Dumper; my @user_info = getpwuid($<); print Dumper \@user_info;';
[
    'dev',
    'x',
    1000,
    1000,
    '',
    '',
    ',,,',
    '/home/dev',
    '/usr/bin/zsh'
];
```
```bash
#   perl oneliner: to check module installed version:
perl -MData::Dumper -le 'print Data::Dumper->VERSION';
# 2.174
```
```bash
#   perl oneliner: to check %INC loaded modules path:
perl -MData::Dumper -e 'print Dumper \%INC;'
# \%INC = {
#     'Exporter.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/Exporter.pm',
#     'bytes.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/bytes.pm',
#     'strict.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/strict.pm',
#     'warnings/register.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/warnings/register.pm',
#     'warnings.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/warnings.pm',
#     'Carp.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/Carp.pm',
#     'overloading.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/overloading.pm',
#     'constant.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/constant.pm',
#     'Data/Dumper.pm' => '/usr/lib/aarch64-linux-gnu/perl/5.32/Data/Dumper.pm',
#     'XSLoader.pm' => '/usr/lib/aarch64-linux-gnu/perl-base/XSLoader.pm'
# };
```
```bash
#   perl oneliner: color print:
perl -e 'use Term::ANSIColor; print color("red"), "stop_red!\n", color("reset"); print color("green"), "go_green!\n", color("reset");'
# stop_red
# go_green
```
```bash
#   perl oneliner: print all possible encoding:
perl -MEncode -e 'print join "\n" => Encode->encodings(":all")' | grep utf
# utf-8-strict
# utf8
```
```bash
#   perl oneliner: to print whole file:
perl -ne '{print $.," ", $_}' test.log
```
```bash
#   perl oneliner: remove any utf16 characters in file:
perl -n -e 's/^[\xFF\xEF\xBB\xBF]{1,3}//;s/^\xFE\xFE/\xFE/;s/\x00//g;print' < INFILE > OUTFILE
```
```bash
#   perl oneliner: to print file with regexp match only:
perl -ne 'use strict; use warnings; $_ =~ m/(.*?)\.(.*?),(.*)/g; { print $2, "\n" }' test.log
```
```bash
#   perl oneliner: prints today date using linux
perl -e 'print `date +"%m/%d/%Y"`."\n";'
# 10/03/2022
```
```bash
#   perl oneliner: handle xargs fila name space problem
locate -r html$ | perl -lne 'print quotemeta' | xargs grep -i 'find-this' *
```
```bash
#   perl oneliner: print file
perl -e 'use strict; use warnings; my $FH; open( $FH, "<", "test.log" ) or die "Error in opening file/n"; while (my $row = <$FH>){ print $row."\n";}' | wc -l
```
```bash
#   perl oneliner: high res time
perl -MTime::HiRes -le 'print 0+ [ Time::HiRes::stat("/proc/$$") ]->[10]';
# 1562671719.86202
```
```bash
#    perl oneliner: get high res time interval:
perl -e 'use Time::HiRes qw(gettimeofday tv_interval); my $time = [gettimeofday]; sleep 1; print "Interval: " . tv_interval($time)."\n";'
```
```bash
#   perl oneliner: fizzbuzz
perl -e 'use strict; use warnings; use Data::Dumper; print map {$_ % 3 != 0 && $_ % 5 !=0 ? $_."\n" : $_ % 3 == 0 && $_ % 5 == 0 ? "FizzBuzz"."\n": $_ % 3 == 0 ? "Fizz"."\n" : "Buzz"."\n"} 1..100;'
```
```bash
#   perl onliner: handle utf8 data:
perl -Mutf8 -e 'use open ":std", ":encoding(UTF-8)"; print "🔒\n";'
# 🔒
```
```bash
#   perl oneliner: convert image to BASE64:
perl -e 'use MIME::Base64 qw|encode_base64| ; use File::Slurp ; print encode_base64( read_file( $ARGV[0] ) )' test.png
# OAKOQNwQGK2aL1QeJAe3d5HldXNl+6E/afwFTz57Sf2B96Rhy0F5ds5zUlXaKKuW7pdlH1bI7j07
# pGpdvby5ZLOuB38qVftrpbaxVGoObNWaw3TdoJvWx6srUXZyBBwBR8ARcAQcARCo3dMoWxMc5Jjo
# jzLU6LbBPz7zmPx41u9DMZ3xufKnq1rmGu/ER71rdQSSiMAobXuyvvl6ffx24Caxd4lr+v8DeCVA
# D5VFSQcAAAAASUVORK5CYII=
```
---
```perl
#   perl: -d (diagnostics/debug) flag
perl -d test.pl
# n             # to continue line by line.
# x $path;      # eval the expr $path;
```
```perl
#   perl: nytprof: use Devel::NYTProf like this:
perl -d:NYTProf test.pl
```
```perl
#   perl: nytprof with SIGINT stuff: needed for perl catlyst:
export NYTPROF=sigexit=1:file=nytprof.out;
perl -dserver_script.pl -p 7000
```
```perl
#   perl: nytprof: create and open html report:
nytprofhtml --open
nytprofhtml --open --no-flame # skiping subcalls:
```
```perl
#   perl: compile check:
perl -MO=Deparse,-si2 test.pl
```
```perl
#   perl: all subroutine with module: Devel::Wherefore
perl -d:Wherefore test.pl
# Symbols found in package main after compiling test.pl
# Dumper  Data::Dumper::Dumper    /usr/lib/x86_64-linux-gnu/perl/5.30/Data/Dumper.pm      604
# GetOptions      Getopt::Long::GetOptions        /usr/local/share/perl/5.30.0/Getopt/Long.pm     268
# _get_tile_timeline_data main::_get_tile_timeline_data   test.pl     16
# capture Capture::Tiny::capture  (eval 257)      1
```
```perl
# perl: regex CJK Unicode char:
# \p{InCJK_Radicals_Supplement}: U+2E80–U+2EFF
# \p{InKangxi_Radicals}: U+2F00–U+2FDF
# \p{InCJK_Symbols_and_Punctuation}: U+3000–U+303F
# \p{InEnclosed_CJK_Letters_and_Months}: U+3200–U+32FF
# \p{InHiragana}: U+3040–U+309F
# \p{InKatakana}: U+30A0–U+30FF
# \p{InKatakana_Phonetic_Extensions}: U+31F0–U+31FF
# \p{InCJK_Compatibility}: U+3300–U+33FF
# \p{InCJK_Unified_Ideographs_Extension_A}: U+3400–U+4DBF
# \p{InYijing_Hexagram_Symbols}: U+4DC0–U+4DFF
# \p{InCJK_Unified_Ideographs}: U+4E00–U+9FFF
# \p{InCJK_Compatibility_Ideographs}: U+F900–U+FAFF
# \p{InCJK_Compatibility_Forms}: U+FE30–U+FE4F
# \p{InHangul_Syllables}:  U+AC00–U+D7AF
```
```perl
#   perl: get symbol table:
my $symbol_table = eval "\\\%${package}::";
```
```perl
#   perl: Fix warning: use of uninitialized value
$globallines //= 0; # sets it to zero if undef.
```
```perl
#   perl: regex
^(\2tic|(tac))+$
# Matches : tactactic
# Explain: tic can only appear after 2 consecutive tac.
```
```perl
#   perl: getter/setter example:
sub set {
    no strict 'refs';
    my $self = shift;
    if ( @_ % 2 ) {
        croak "Odd number of arguments passed to Test";
    }
    my ( $sub_name, $value );
    while (@_) {
        ( $sub_name, $value ) = ( shift, shift );
        croak "Missing sub_name in set" if ( !$sub_name );
        if ( !exists $self->{HASH}->{$sub_name} ) {
            # Locally scope sub_name, or else function will always return last $sub_name
            my $_name = $sub_name;
            *{$_name} = sub {
                $_[0]->get($_name);
            };
        }
        $self->{HASH}->{$sub_name} = $value;
    }
    return $value;
}
sub get {
    my $self = shift;
    my ( $obj, $value ) =
        ( exists $self->{HASH}->{ $_[0] } )
      ? ( $self, $self->{HASH}->{ $_[0] } )
      : ( undef, undef );
    # return default, if not found:
    return $_[1] if ( !$obj );
    # call it and return the result, If method:
    return &$value( $self, @_ ) if ( ref $value eq "CODE" );
    return $value;
}
```
```perl
#   perl: change $USER within perl script: Using linux uid:
use POSIX qw(setuid getuid);
my $w = scalar getpwuid($<);
if ( $w eq 'root' ) {
    print "Hey, you're root... let's try to become 'user_name'\n";
    my (
        $pwName,    $pwCode, $pwUid,  $pwGid, $pwQuota,
        $pwComment, $pwGcos, $pwHome, $pwLogprog
    ) = getpwnam("user_name");    # become user user_name
    unless ($pwUid) {
        die("That user doesn't exist\n");
    }
    print "Trying to become UID $pwUid\n";
    setuid($pwUid);               # Become user_name
}
elsif ( $w ne 'user_name' ) {
    die("You must be user_name to run this\n");
}
$w = scalar getpwuid($<);         # Test who we are
print "Ok, now we are: " . $w . "\n";
```
```perl
#   perl: regex: positive lookahead: matches characters immediately followed by the same charcter:
(\w)(?=\1)
```
```perl
#   perl: regex: negative lookahead: matches characters immediately not followed by the same charcter:
(\w)(?!\1)
```
```perl
#   perl date: 10/03/2022
use POSIX qw(strftime);
my $date = strftime "%m/%d/%Y", localtime;
print $date;
```
```perl
#   perl: find repeated elements in array:
my %uniq;
if ( grep ++$uniq{ $_ } > 1, @numbers ) {
    # some numbers are repeated
}
```
```perl
#   perl: map usage:
my @sorted_numbers = sort { $a <=> $b } map hex, @numbers;
```
```perl
#   perl feature : file size in perl or linux
my $size = (stat $file_path)[7];
```
```perl
#   perl: sort array of hashref
my @sorted = sort { $a->{k1} <=> $b->{k1} } @l;
```
```perl
#   perl: mixing two array in perl.
@array1 = qw/test1 test2 test3 test4 test5/;
@array2 = qw/answer1 answer2 answer3 answer4 answer5/;
@array3 = ();
map {push(@array3, $array1[$_] . "|" . $array2[$_])} 0..$#array1;
# \@array3 = [
#     'test1|answer1',
#     'test2|answer2',
#     'test3|answer3',
#     'test4|answer4',
#     'test5|answer5'
# ];
```
```perl
#   perl: get full file path from script running location:
my $file_name = Cwd::realpath($File::Find::name);
```
```perl
#   perl: file find rules:
use File::Find::Rule;
```
```perl
#   perl: get fraction with given accuracy:
use Math::BigFloat;
Math::BigFloat->accuracy(8);
print new Math::BigFloat $pos/$total_element;
# 0.5 => 0.500000
```
```perl
#   perl: get index of searched value in array:
my ($index) = grep { $array[$_] eq $val } (0 .. @array-1);
print defined $index ? $index : -1;
```
```perl
#   perl: find file with rules:
# find ./ -maxdepth 1 -mtime -1 -type d
# as above, but without method chaining
my @sub_dir =  File::Find::Rule->directory
    ->maxdepth('1')
    ->mtime( '>1' )
    ->in( '/home/abhinickz/projects' );
```
```perl
#   perl: regex: get no of occurences without loop.
my $string = "one.two.three.four";
my $number = () = $string =~ /\./gi; # 3
```
```perl
#   perl: handling rrrors in perl with eval and use the error message as you wish.
eval {
    print "eval";
    # die;
};
if ($@) {
    print "test1\n";
}
END {
    if ($@) {
        print "test2\n";
    }
}
```
```perl
#   perl: add custom perl modules dir in lib:
export PERL5LIB=/test/perl_mod
```
```perl
#   perl: terminal and file use UTF8:
use open ':std', ':encoding(UTF-8)';
```
```perl
#   perl: get start time of script run: use as CONSTANT
use constant YMD_HMS_AT_START => POSIX::strftime( "%F %T", localtime $^T );
print YMD_HMS_AT_START . "\n";
# 2022-10-03 00:20:47
```
```perl
#   perl: datetime past format:
use DateTime qw();
my $dt3 = DateTime->now->subtract(days => 1)->ymd("-");
print "date: $dt3\n"
# '2020-11-11'
```
```perl
#  perl: file operation: encoding options:
open ( my $FH, '>:encoding(Latin1)', '/tmp/file.log' );
open ( my $FH, '>:encoding(iso-8859-1)', '/tmp/file.log' );
```
```perl
#   perl: open file in binmode already, no need for binmode here:
open my $fh, '<:raw', '/usr/share/zoneinfo/America/New_York';
```
```perl
#   perl: get file mimetype:
my ($mime_type)= split( /;|\s/, $_ );
```
```perl
#   perl: disbale SSL in HTTP request LWP:
$user_agent->ssl_opts( verify_hostname => 0, SSL_verify_mode => 0x00 );
```
```perl
#   perl: Template::Toolkit:
#    *.pm changes:
$c->stash->{tt_test} => {status_name => 'test'};
$c->stash->{status_value} = {
    test => 'test_value',
};
```
```perl
#   perl: min and max from array list:
my ( $max, $min ) = ( -1e99, 1e99 ); #	Initialize to values outside anything in your list:
map { $max = $_ if ( $_ > $max ); $min = $_ if( $_ < $min ); } @sums;
```
```perl
#   perl: skip uninitialized warnings:
no warnings "uninitialized";
```
```perl
#   perl: remove duplicate chars from string & count the minimum no of steps required:
my $string = <STDIN>;
chomp( $string );
my $count = 0;
while ( $string =~ /(.)(?=.*?\1)/g ) {
    $string =~ s/(.)(?=.*?\1)//;
    $count++;
}
print $count;
```
```perl
#   perl: get chars ASCII Values.
perl -e 'use utf8; print ord ( 'a' ); print "\n";'
# 97
```
```perl
#   perl: get char from code value:
perl -e 'use utf8; print chr (97); print "\n";'
# a
perl -e 'use utf8; use open ":std", ":encoding(UTF-8)"; print "\t$_:".chr($_) for ( 500..505 ); print "\n";'
#	 500:Ǵ	501:ǵ	502:Ƕ	503:Ƿ	504:Ǹ	505:ǹ
```
```perl
#   perl: sort keys values numerically in hashes:
print $_ . "\n" foreach ( sort { $a <=> $b } keys %perms );
print $perms{$_} . "\n" foreach ( sort { $a <=> $b } values %perms );
```
```perl
#   perl: array memory efficient:
{
    local $, = "\n";
    print @big_array;
}
```
```perl
# perl: permutation/combinations:
sub permute {
    my $last = pop @_;
    unless (@_) {
        return map [$_], @$last;
    }
    return map { my $left = $_; map [@$left, $_], @$last } permute(@_);
}
sub combinations {
    return [] unless @_;
    my $first = shift;
    my @rest = combinations(@_);
    return @rest, map { [$first, @$_] } @rest;
}
print "permute:\n";
print "[", join(", ", @$_), "]\n" for permute([1,2,3], [4,5,6], [7,8,9]);
print "combinations:\n";
print "[", join(", ", @$_), "]\n" for combinations(1..5);
```
```perl
#   perl: get substring:
my @cache;
sub sub_string {
    $_ = shift;
    return &{$cache[length($_)]} if exists $cache[length($_)];
    my $sub = 'sub { return (';
    foreach my $len (1..length($_)-1) {
        foreach my $off (0..length($_)-$len) {
            $sub .= "substr(\$_, $off, $len),";
        }
    }
    $sub .= "\$_)};";
    $cache[length($_)] = eval $sub;
    return &{$cache[length($_)]};
}
```
```perl
#   perl: reference: ARRAY of ARRAY reference:
push @{ $perms->[ $i ] }, ( $permutation );
```
```perl
#   perl: all possible substring of string:
push @list, $number_input =~ /(?=(.{$_}))/g for 1 .. length $number_input;
```
```perl
#   perl: Inhertiance:
use base 'MyParent';
# OR
use MyParent;
our @ISA = ('MyParent'); # have to load the modules yourself.
```
```perl
#   perl: export/export_ok
# @EXPORT: imports all method in your module namespace. use YourModule (); to not.
# OR
# @EXPORT_OK: imports all method in your module namespace only if you use YourModule qw(method).
```
```perl
#   perl: dbi mysql dsn:
my $dbh_obj = DBI->connect('DBI:mysql:database=dev;host=mysql.dummy.com', 'dev', 'PASSWORD', {'RaiseError' => 1, 'PrintError'=> 0});
```
```perl
#   perl: snippet for db values:
my @source_columns = qw{source_id lastupdate};
my $source_data    = [
    {
        'lastupdate' => '2004-01-11 02:52:23',
        'source_id'  => '2325',
    }
];
my $insert_values .=
  join( ', ', map { $source_data->[0]->{$_} } @source_columns );
# '2325, 2004-01-11 02:52:23'
```
```perl
#    *.tt changes:
<!-- status_name : [% tt_test.status_name %] -->
<!-- [% USE Dumper %] -->
<!-- status_value: [% Dumper.dump(status_value) %] -->
<!-- status_value : [% status_value.item(tt_test.status_name) %] -->
# output:
# status_name : test
# feature_status_value: $VAR1 = { 'test' => 'test_value' };
# feature_status_value2 : test_value
```
```perl
#   perl: debugging:
#!/usr/bin/perl
use strict; use warnings; use Data::Dumper;
no warnings "uninitialized";
my $debug;
$debug = 0;
$debug = 1;

$Data::Dumper::Sortkeys = 1;
$Data::Dumper::Terse = 1; # AVOID VAR1 in dumper
$Data::Dumper::Deparse  = 1; # Turn subroutine ref back into code.
$Data::Dumper::Sortkeys = sub {
    no warnings 'numeric';
    [ sort { $a <=> $b } keys %{ $_[ 0 ] } ]
};

my ( $package, $filename, $line ) = caller;
print STDERR "x" x 125                . "\n";
print STDERR "PACKAGE: "  . $package  . "\n";
print STDERR "FILENAME: " . $filename . "\n";
print STDERR "LINE: "     . $line     . "\n";
print STDERR "x" x 125                . "\n";

use Term::ANSIColor;
print color("red"),  Dumper("Stop!"), color("reset");
print color("blue"), Dumper("Stop!"), color("reset");

# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
# PACKAGE: main
# FILENAME: test.pl
# LINE: 6
# xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```
```perl
#   perl: POD example:
__END__
=pod

=head1 Link : https://www.hackerrank.com/challenges/kangaroo

=cut
```
---
```sql
--  ORACLE:
--  oracle: sqlplus: change 3.7850E+10 exponential format to 37849883329.
SHOW NUMWIDTH
NUMWIDTH 10
SET NUMWIDTH 15
```
```sql
--  oracle: sqlplus: reverse-serach and up-down will give history.
--  oracle: sqlplus: rlwrap -c sqlplus abhinickz@test.sql.com
SET LINE 32000
```
```sql
--  oracle: sqlplus: truncates the line if its is longer then LINESIZE
SET WRAP ON
```
```sql
--  oracle: sqlplus: linesize the length of the line
SET LINESIZE
```
```sql
-- oracle: sqlplus: change column_name size: where a10 defines column size & column_name is column name:
COLUMN column_name FORMAT a10
```
```sql
--  oracle: temp table rows with columns:
SELECT 1, 2, 3 FROM dual
    UNION ALL -- UNION
SELECT 4, 5, 6 FROM dual
    UNION ALL -- UNION
SELECT 7, 8, 9 FROM dual;
```
```sql
--  oracle: get all tables in abhinickz schema in with owner "abhinickz".
SELECT DISTINCT owner, object_name 
    FROM dba_objects
WHERE object_type = 'TABLE'
    AND owner = 'abhinickz';
```
```sql
--  oracle: table search:
SELECT table_name FROM all_tables WHERE table_name LIKE '%BLOB%' AND owner = 'ABHINICKZ';
```
```sql
--  oracle: regex datetime:
AND NOT REGEXP_LIKE (string_value, '[[:digit:]]{2}\/[[:digit:]]{2}\/[[:digit:]]{4} [[:digit:]]{2}:[[:digit:]]{2}:[[:digit:]]{2}');
-- oracle: regex example:
REGEXP_LIKE(string_value, '[^[:alnum:]^[:space:]]');
```
```sql
-- oracle: convert column to NUMBER from VARCHAR & use REGEX on ORACLE with GROUP CAPTURING:
SELECT
    prefix,
    'PRE' || LPAD((TO_NUMBER(REGEXP_REPLACE( prefix, 'PRE([[:digit:]]{8})', '\1' )) + 1), 8, '0') "new_prefix" 
FROM abhinickz.data;
```
```sql
--  oracle: UPDATE query example:
-- multiple rows updated with one query.
UPDATE ABHINICKZ.DATA_FINAL DF_1
SET DF_1."Duration Time" = (
    SELECT
        ROUND((TO_DATE(DF_2."Stop Time", 'DD/MM/YYYY HH24:MI:SS') - TO_DATE(DF_2."Start Time", 'DD/MM/YYYY HH24:MI:SS')) * 24 * 60 * 60) AS DURATION
    FROM ABHINICKZ.DATA_FINAL DF_2
    WHERE DF_1."SegID" = DF_2."SegID"
);
SELECT TO_NUMBER(TO_CHAR(TO_DATE("DURATION",'HH24:MI:SS'),'SSSSS'))/60  AS MINS FROM ABHINICKZ.DATA_FINAL;
```
```sql
--  oracle: SELECT query with data/time operation
SELECT C.*,
    TO_NUMBER(TO_CHAR(TO_DATE('1', 'J') + (to_date("StopTime", 'DD/MM/YYYY HH24:MI:SS') - to_date("StartTime", 'DD/MM/YYYY HH24:MI:SS')), 'J') - 1) days,
    TO_CHAR(TO_DATE('00:00:00', 'HH24:MI:SS') + (to_date("StopTime", 'DD/MM/YYYY HH24:MI:SS') - to_date("StartTime", 'DD/MM/YYYY HH24:MI:SS')), 'HH24:MI:SS') TIME_1,
	((to_date("StopTime", 'DD/MM/YYYY HH24:MI:SS') - to_date("StartTime", 'DD/MM/YYYY HH24:MI:SS')) * 24 * 60 * 60) TIME_2
FROM ABHINICKZ.DATA_FINAL DF;
```
```sql
--  oracle: timezone change information.
CAST(TO_TIMESTAMP_TZ(REGEXP_REPLACE(DATERECEIVED,'(.+?)T(.+?)(\-.*)','\1 \2 \3'),'YYYY-MM-DD HH24:MI:SSXFF TZH:TZM') at time zone 'EST' as DATE)
```
```sql
--  oracle: extract only date, month from dateTime
SELECT occurred$$, TO_CHAR( occurred$$, 'DD' ) FROM ABHINICKZ.docs;
-- 23-JUN-15 => 23
SELECT occurred$$, TO_CHAR( occurred$$, 'mm' )
-- 23-JUN-15 => 06 (returns month number)
```
```sql
--  oracle: CREATE queries:
CREATE TABLE ABHINICKZ_DEV.docs AS
SELECT id, xl_pre, display_name, xl_fix || 'af' AS xl_af_pre
FROM ABHINICKZ_INT.docs
WHERE display_name IN (
    SELECT DISTINCT REGEXP_REPLACE( REPLACE ( F2, F1 || '.MP3' ), '\.\/TEST \(Audio Only\)\/(.*)\/Audio Files\/', '\1' ) cust
FROM ABHINICKZ_INT.lftxt);
```
```sql
CREATE TABLE ABHINICKZ.DATA AS
SELECT xl_pre, NVL( MAX (bt_num),0 ) used_num
FROM ABHINICKZ_INT.DOCS, ABHINICKZ_DEV.DOCS dev_docs
WHERE bt_alpha(+) = dev_docs.xl_pre
GROUP BY xl_pre;
```
```sql
CREATE TABLE ABHINICKZ.DATA AS
SELECT xl_pre || LPAD ( ( ROW_NUMBER() OVER ( PARTITION BY SUBSTR ( f1, 1, 4 ) ORDER BY f1 ) + used_num ), 8, 0 ) new_data,
lf.* 
FROM ABHINICKZ_INT.DATA lf, ABHINICKZ_DEC.DATA b
WHERE SUBSTR(f1,1,4)|| 'AF' = xl_pre;
```
```sql
--  oracle: show create table like mysql
SET HEADING OFF;
SET ECHO OFF;
SET PAGES 999;
SET LONG 90000;
SPOOL DDL_LIST.sql
SELECT DBMS_METADATA.get_ddl('TABLE','DEPT','TEST') FROM dual;
SELECT DBMS_METADATA.get_ddl('INDEX','DEPT_IDX','TEST') FROM dual;
SPOOL OFF;
```
```sql
-- /*
-- load data
-- CHARACTERSET 'WE8ISO8859P1'
-- infile 'data.txt'
-- badfile 'data.bad'
-- discardfile 'data.dsc'
-- append INTO TABLE ABHINICKZ.DATA FIELDS terminated by X'14'
-- (USERID, LASTNAME, FIRSTNAME, USERNAME, IS_ACTIVE)
-- */
```
```sql
--  mssql: Microsoft SQL Server 
--  mssql: show DB version:
SELECT @@VERSION;
```
```sql
--  mssql: show DB name:
SELECT DB_NAME(db_id());
```
```sql
--  postgres: find tables name ended with "tion": glob pattern
\d public.*"tion"
```
```sql
--  postgres: get list of fdw servers:
\des+
--                                                                  List of foreign servers
--     Name    |  Owner    | Foreign-data wrapper | Access privileges | Type | Version |                      FDW options            | Description 
-- ------------+-----------+----------------------+-------------------+------+---------+---------------------------------------------+-------------
--  dev_server | abhinickz | postgres_fdw         |                   |      |         | (host '0.0.0.0', port '5432', dbname 'dev') | dev_map
--  int_server | abhinickz | postgres_fdw         |                   |      |         | (host '0.0.0.0', port '5432', dbname 'int') | int_map
```
```sql
--  postgres: get fdw user mappings:
\deu+
--                           List of user mappings
-- ┌────────────┬───────────┬────────────────────────────────────────┐
-- │   Server   │ User name │                 FDW options            │
-- ╞════════════╪═══════════╪════════════════════════════════════════╡
-- │ dev_server │ abhinickz │ ("user" 'abhinickz', password 'XXXXX') │
-- │ int_server │ abhinickz │ ("user" 'abhinickz', password 'XXXXX') │
-- └────────────┴───────────┴────────────────────────────────────────┘
```
```sql
-- postgres: create fdw user mapping:
CREATE USER MAPPING
FOR PUBLIC
SERVER dev_server
OPTIONS (user 'abhinickz', password 'XXXXX');
```
```sql
CREATE USER MAPPING
FOR PUBLIC
SERVER int_server
OPTIONS (user 'abhinickz', password 'XXXXX');
```
```sql
-- postgres: drop fdw user mapping:
DROP USER MAPPING FOR abhishek SERVER dev_server;
DROP USER MAPPING FOR abhishek SERVER int_server;
```
```sql
-- postgres: update fdw server mapping port:
ALTER SERVER dev_server OPTIONS (SET port '5433');
ALTER SERVER int_server OPTIONS (SET port '5433');
```
```sql
--  postgres: check login info use following command from database command prompt.
\conninfo
-- You are connected to database "postgres" as user "postgres" via socket in "/tmp" at port "5432".
```
```sql
--  postgres: create test db:
CREATE DATABASE test;
```
```sql
--  postgres: create db by copying:
CREATE DATABASE dev_data WITH TEMPLATE int_data OWNER abhinickz;
```
```sql
--  postgres: create user with password:
CREATE USER dev_user WITH ENCRYPTED PASSWORD 'XXXXX';
```
```sql
--  postgres: grant access to user for below db:
GRANT ALL PRIVILEGES ON DATABASE postgres TO dev_user;
GRANT ALL PRIVILEGES ON database test TO dev_user;
```
```sql
--  postgres: grant create db access.
ALTER USER dev_user CREATEDB;
```
```sql
--  postgres: grant superUser access to create postgres extension.
ALTER ROLE dev_user SUPERUSER;
```
```sql
--  postgres: delete user from db.
DROP OWNED BY dev_user;
DROP USER dev_user;
```
```sql
--  postgres: copy data and structure but not index and triggers:
CREATE TABLE tbl_new AS SELECT * FROM tbl_old;
```
```sql
--  postgres: copy data and structure with index, triggers:
CREATE TABLE newtable LIKE oldtable; 
INSERT newtable SELECT * FROM oldtable;
```
```sql
-- postgres: create table example:
CREATE TABLE fruits AS
SELECT
    fruits.column1 AS name,
    fruits.column2 AS quantity
FROM (
    VALUES
    ('apple', 3),
    ('apple', 2),
    ('orange', 1),
    ('grapes', 2),
    ('grapes', 2),
    ('watermelon', 3)
) fruits;
```
```sql
-- postgres: copy table with DEFAULTS, INDEX, CONSTRAINTS: without data:
CREATE TABLE dev_data_test ( like dev_data INCLUDING DEFAULTS INCLUDING CONSTRAINTS INCLUDING INDEXES );
```
```sql
--  postgres: INSERT OR UPDATE: CONFLICT ON CONSTRAINT:
INSERT INTO "set_value" (id, instance_val, instance_id)
SELECT 1, '["dev","int"]' AS instance_val, 1 AS instance_id
FROM dev_test
ON CONFLICT ON CONSTRAINT unique_instance_val
DO UPDATE SET instance_val = EXCLUDED.instance_val
```
```sql
--  postgres: INSERT OR UPDATE: CONFLICT ON column:
INSERT INTO "set_value" (id, instance_val, instance_id)
SELECT 1, '["dev","int"]' AS instance_val, 1 AS instance_id
FROM dev_test
ON CONFLICT (instance_id)
DO UPDATE SET instance_val = EXCLUDED.instance_val;
```
```sql
--  postgres: MINUS type operator and UNION:
SELECT * FROM ( SELECT 1, 2, 3 UNION SELECT 2, 3, 4 UNION SELECT 3, 4, 5 ) qr_1
EXCEPT
SELECT * FROM ( SELECT 2, 3, 4 UNION SELECT 1, 2, 3 UNION SELECT 3, 4, 5) qr_2;
```
```sql
--  postgres: random value between column h and l:
SELECT floor(random() * (h-l+1) + l)::int;
--  floor
-- -------
--      6
```
```sql
-- postgres: NOTICE will not be printed because of STRICT:
CREATE OR REPLACE FUNCTION add_ten(num int) RETURNS integer AS $$
BEGIN
    PERFORM pg_sleep(0.1);
    RAISE NOTICE 'add_ten called';
    RETURN num + 10;
END
$$ LANGUAGE 'plpgsql' IMMUTABLE STRICT;
SELECT * FROM add_ten(NULL);
```
```sql
--  postgres: lateral JOIN:
SELECT
    serv.id,
    settings.settings_keys
FROM servers AS serv
LEFT JOIN LATERAL (SELECT * FROM JSON_OBJECT_KEYS(serv.settings)) AS settings_keys ON TRUE;
```
```sql
--  postgres: INSERT postgres array:
INSERT INTO dev_data SELECT 1 AS id, ARRAY['1', '2'] AS dev_id;
-- INSERT 0 1
SELECT * FROM dev_data;
--  id | dev_id
-- ----+-------
--   1 | {1,2}
```
```sql
--  postgres: psql: client settings:
SELECT name, setting FROM pg_settings WHERE category ~ 'Locale';
--             name            |      setting
-- ----------------------------+--------------------
--  client_encoding            | UTF8
--  DateStyle                  | ISO, MDY
--  default_text_search_config | pg_catalog.english
--  extra_float_digits         | 1
--  IntervalStyle              | postgres
--  lc_messages                | C
--  lc_monetary                | C
--  lc_numeric                 | C
--  lc_time                    | C
--  TimeZone                   | UTC
--  timezone_abbreviations     | Default
```
```sql
--  postgres: get current time zone:
SELECT current_setting('TIMEZONE');
--  current_setting
-- -----------------
--  UTC
```
```sql
--  postgres: get current epoch time format:
SELECT EXTRACT(EPOCH FROM NOW())::INT AS EPOCH_NOW;
--  epoch_now
-- ------------
--  1664281499
```
```sql
--  postgres: function to get table info:
CREATE OR REPLACE FUNCTION dt(tbl_name TEXT)
RETURNS TABLE (
    column_name VARCHAR, data_type VARCHAR,character_maximum_length INT
) AS $$
SELECT column_name, data_type, character_maximum_length
FROM INFORMATION_SCHEMA.COLUMNS WHERE lower(table_name) LIKE '%$1%';
$$
LANGUAGE 'sql';
```
```sql
--  postgres: check running query:
SELECT * FROM pg_stat_activity WHERE datname = 'dev_test';
-- -[ RECORD 1 ]----+--------------------------------
-- datid            | 12971
-- datname          | postgres
-- pid              | 167
-- leader_pid       |
-- usesysid         | 10
-- usename          | postgres
-- application_name | psql
-- client_addr      |
-- client_hostname  |
-- client_port      | -1
-- backend_start    | 2022-09-27 12:18:21.7741+00
-- xact_start       | 2022-09-27 14:07:40.3816+00
-- query_start      | 2022-09-27 14:07:40.3816+00
-- state_change     | 2022-09-27 14:07:40.3817+00
-- wait_event_type  |
-- wait_event       |
-- state            | active
-- backend_xid      |
-- backend_xmin     | 735
-- query_id         |
-- query            | SELECT * FROM pg_stat_activity;
-- backend_type     | client backend
```
```sql
--  postgres: check autovacuum is running or not:
SELECT COUNT(*) FROM pg_stat_activity WHERE query LIKE 'autovacuum:%';
```
```sql
--  postgres: function to get table info from column search:
SELECT column_name, data_type, character_maximum_length
FROM INFORMATION_SCHEMA.COLUMNS WHERE lower(column_name) LIKE '%id%'
-- |   table_name  | column_name |  data_type | character_maximum_length|
-- +-------------- +-------------+------------+-------------------------+
-- | pg_proc       | oid         | oid        |                         |
-- | pg_attribute  | attrelid    | oid        |                         |
-- | pg_class      | oid         | oid        |                         |
-- | pg_attrdef    | oid         | oid        |                         |
-- | pg_constraint | conrelid    | oid        |                         |
```
```sql
--  postgres: formatted columns names:
SELECT
    '"' || string_agg(column_name, '", "') || '"' AS column_names
FROM (
    SELECT
        column_name
    FROM information_schema.columns
    WHERE table_catalog = (SELECT current_database())
        AND table_name = 'table_name'
    ORDER BY ordinal_position 
) sq;
-- -[ RECORD 1 ]+-----------------------------------------
-- column_names | "oid", "umoptions", "umuser", "srvowner"
```
```sql
--  postgres: db creation time:
SELECT (pg_stat_file('base/'||oid ||'/PG_VERSION')).modification, datname FROM pg_database WHERE datname = 'dev';
--        modification        | datname
-- ---------------------------+---------
--  2022-03-26 19:48:10+05:30 | dev
```
```sql
--  postgres: copy any query data to csv:
\COPY(SELECT * FROM table_name) To '/tmp/table_data.csv' With CSV DELIMITER ',' HEADER;
```
```sql
--  postgres: copy whole table_name data to csv:
COPY table_name FROM '/tmp/table_data.csv' WITH (FORMAT csv);
```
```sql
--  postgres: VACUUM DB with verbose:
VACUUM(FULL, ANALYZE, VERBOSE);
VACUUM(FULL, ANALYZE, VERBOSE) table_name;
-- INFO:  vacuuming "public.test"
-- INFO:  "test": found 0 removable, 0 nonremovable row versions in 0 pages
-- DETAIL:  0 dead row versions cannot be removed yet.
-- CPU: user: 0.00 s, system: 0.00 s, elapsed: 0.00 s.
-- INFO:  analyzing "public.test"
-- INFO:  "test": scanned 0 of 0 pages, containing 0 live rows and 0 dead rows; 0 rows in sample, 0 estimated total rows
-- VACUUM
```
```sql
--  postgres: dead tuples:
SELECT relname, n_dead_tup FROM pg_stat_user_tables WHERE n_dead_tup > 0 ORDER BY n_dead_tup DESC;
--  relname  | n_dead_tup
-- ----------+------------
--  dev_data |      23918
```
```sql
--  postgres: last vacuum date:
SELECT relname, last_vacuum, last_autovacuum FROM pg_stat_user_tables WHERE last_autovacuum IS NOT NULL ORDER BY last_autovacuum DESC;
--  relname  | last_vacuum |         last_autovacuum
-- ----------+-------------+----------------------------------
--  dev_data | NULL        | 2022-07-09 12:13:40.563925+05:30
```
```sql
--  postgres: debug: use variable value:
\set epoch_now '(SELECT EXTRACT (EPOCH FROM NOW())::INT AS epoch_now);'
SELECT :epoch_now;
-- 1664292774
```
```sql
--  postgres: build JSON object:
SELECT json_build_object('id', id, 'json_data', my_json_field::jsonb, 'type', 'my_type')::jsonb FROM my_data;
```
```sql
--  postgres: add JSONB key/value:
UPDATE
    dev_data
SET
    meta_data = meta_data::jsonb || ' { "user" : "abhinickz" }'::jsonb
WHERE id= 1;
```
```sql
--  postgres: temp table:
BEGIN; -- start transaction
CREATE TEMPORARY TABLE temp_table_test ON COMMIT DROP AS SELECT 1;
SELECT * from temp_table_test;
COMMIT; -- drops the temp table
SELECT * from temp_table_test;
-- ERROR:  relation "temp_table_test" does not exist
-- LINE 1: SELECT * from temp_table_test;
```
```sql
--  postgres: kill running query
SELECT pg_cancel_backend( procpid );
```
```sql
--  postgres: kill idle query
SELECT pg_terminate_backend( procpid );
```
```sql
--  postgres: all database users
SELECT * FROM pg_stat_activity where current_query not like '<%';
```
```sql
--  postgres: all databases and their sizes
SELECT * FROM pg_user;
-- -[ RECORD 1 ]+---------
-- usename      | postgres
-- usesysid     | 10
-- usecreatedb  | t
-- usesuper     | t
-- userepl      | t
-- usebypassrls | t
-- passwd       | ********
-- valuntil     |
-- useconfig    |
```
```sql
--  postgres: all tables and their size, with/without indexes
SELECT datname, pg_size_pretty(pg_database_size(datname))
FROM pg_database
order by pg_database_size(datname) desc;
```
```sql
--  postgres: cache hit rates (should not be less than 0.99)
SELECT sum(heap_blks_read) as heap_read, sum(heap_blks_hit)  as heap_hit, (sum(heap_blks_hit) - sum(heap_blks_read)) / sum(heap_blks_hit) as ratio
FROM pg_statio_user_tables;
--  heap_read | heap_hit |          ratio
-- -----------+----------+-------------------------
--          3 |        2 | -0.50000000000000000000
```
```sql
--  postgres: table index usage rates (should not be less than 0.99)
SELECT relname, 100 * idx_scan / (seq_scan + idx_scan) percent_of_times_index_used, n_live_tup rows_in_table
FROM pg_stat_user_tables 
ORDER BY n_live_tup DESC;
--  relname | percent_of_times_index_used | rows_in_table
-- ---------+-----------------------------+---------------
--  dev     |                             |             6
```
```sql
--  postgres: how many indexes are in cache
SELECT sum(idx_blks_read) as idx_read, sum(idx_blks_hit)  as idx_hit, (sum(idx_blks_hit) - sum(idx_blks_read)) / sum(idx_blks_hit) as ratio
FROM pg_statio_user_indexes;

--  postgres: pretty json:
SELECT jsonb_pretty('{"cur_date": "2022-07-23 23:59:59","day_diff": 30 }');
--               jsonb_pretty
-- ----------------------------------------
--  {                                     +
--      "cur_date": "2020-11-23 23:59:59",+
--      "day_diff": 30                    +
--  }
```
```sql
--  postgres: get table/index size:
SELECT *, pg_size_pretty(total_bytes) AS total
    , pg_size_pretty(index_bytes) AS index
    , pg_size_pretty(toast_bytes) AS toast
    , pg_size_pretty(table_bytes) AS table
  FROM (
  SELECT *, total_bytes-index_bytes-coalesce(toast_bytes,0) AS table_bytes FROM (
      SELECT c.oid,nspname AS table_schema, relname AS table_name
              , c.reltuples AS row_estimate
              , pg_total_relation_size(c.oid) AS total_bytes
              , pg_indexes_size(c.oid) AS index_bytes
              , pg_total_relation_size(reltoastrelid) AS toast_bytes
          FROM pg_class c
          LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
          WHERE relkind = 'r'
          AND nspname = 'public'
  ) a
) a;
-- -[ RECORD 1 ]+-----------
-- oid          | 16388
-- table_schema | public
-- table_name   | dev_data
-- row_estimate | 6
-- total_bytes  | 16384
-- index_bytes  | 0
-- toast_bytes  | 8192
-- table_bytes  | 8192
-- total        | 16 kB
-- index        | 0 bytes
-- toast        | 8192 bytes
-- table        | 8192 bytes
```
```sql
--  postgres: check and fix postgres id sequence:
SELECT nextval('dev_data_id_seq');
SELECT setval('dev_data_id_seq', (SELECT MAX(id) FROM dev_data) + 1);
```
```sql
-- mysql: get db hostname:
SELECT @@hostname;
-- +------------------------+
-- | @@hostname             |
-- +------------------------+
-- | abhinickz.test.dev     |
-- +------------------------+
```
```sql
--  mysql: show tables in different DB:
SHOW TABLES IN db_name like '%rep_worklog%';
```
```sql
--  mysql: get table with comments:
SELECT TABLE_SCHEMA, TABLE_NAME, TABLE_COMMENT FROM information_schema.TABLES where TABLE_COMMENT <> '';
-- +--------------+-----------------+-----------------------------------------------------+
-- | TABLE_SCHEMA | TABLE_NAME      | TABLE_COMMENT                                       |
-- +--------------+-----------------+-----------------------------------------------------+
-- | dev          | test_type       | Contains a user link-type used in linked_dev table  |
-- | dev          | linked_dev      | User link between dev DB and 3rd party app          |
-- | dev          | intg_time_type  | Look up table for intg                              |
-- +--------------+-----------------+-----------------------------------------------------+
```
```sql
--  mysql: show temporary session like tables:
SHOW TABLES FROM INFORMATION_SCHEMA LIKE 'INNODB_TEMP%';
```
```sql
--  mysql: get hosts for all incoming requests/running queries:
SELECT host FROM information_schema.processlist;
mysqladmin -u root -p processlist
-- Enter password:
-- +----+------+-----------+----+---------+------+----------+------------------+
-- | Id | User | Host      | db | Command | Time | State    | Info             |
-- +----+------+-----------+----+---------+------+----------+------------------+
-- | 7  | root | localhost |    | Query   | 0    | starting | show processlist |
-- +----+------+-----------+----+---------+------+----------+------------------+
```
```sql
--  mysql: duplicate column having X no of count:
SELECT column_name,
    COUNT(column_name_1)
FROM TABLE
GROUP BY column_name
HAVING COUNT(column_name_1) > 1;
```
```sql
--  mysql: check db encoding:
SELECT schema_name 'database', default_character_set_name 'charset', default_collation_name 'collation' FROM INFORMATION_SCHEMA.schemata WHERE schema_name = 'test';
-- +----------+---------+-------------------+
-- | database | charset | collation         |
-- +----------+---------+-------------------+
-- | test     | latin1  | latin1_swedish_ci |
-- +----------+---------+-------------------+
```
```sql
--  mysql: get db encoding:
use db_name;
SELECT @@character_set_database;
-- +--------------------------+
-- | @@character_set_database |
-- +--------------------------+
-- | latin1                   |
-- +--------------------------+
```
```sql
--  mysql: get db size(MB):
SELECT
    table_schema "DB Name",
    Round(Sum(data_length + index_length) / 1024 / 1024, 1) "DB Size in MB"
FROM information_schema.tables
GROUP BY table_schema;
-- +--------------------+---------------+
-- | DB Name            | DB Size in MB |
-- +--------------------+---------------+
-- | dev                |         165.1 |
-- +--------------------+---------------+
```
```sql
--  mysql: fix replication process:
STOP SLAVE;
START SLAVE;
CHANGE MASTER TO MASTER_HOST = 'dev_host', MASTER_USER = 'repl_user', MASTER_PASSWORD = 'XXXXX', MASTER_LOG_FILE = 'binlog.00420', MASTER_LOG_POS = 0420;
```
```sql
--  mysql: Include this line in DB ctl file to change encoding to latin1:
-- CHARACTERSET 'WE8ISO8859P1'
```
```sql
--  mysql: create table and insert data: example:
CREATE TABLE `amount` (
    `id`                    INTEGER(5) UNSIGNED AUTO_INCREMENT,
    `created_at`            DATETIME DEFAULT NULL,
    `updated_at`            TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `value`                 INTEGER(12) UNSIGNED,
    `dev_name`              VARCHAR(250),
    `due_date`              DATETIME DEFAULT NULL,
    PRIMARY KEY (id)
);
INSERT INTO `amount` (value, dev_name) SELECT 55555, 'abhinickz';
```
```sql
--  mysql: now minus min example:
SELECT NOW() - INTERVAL 10 MINUTE AS 10MINAGO, NOW() AS NOW;
-- +---------------------+---------------------+
-- | 10MINAGO            | NOW                 |
-- +---------------------+---------------------+
-- | 2018-05-02 07:32:18 | 2018-05-02 07:42:18 |
-- +---------------------+---------------------+
```
```sql
--  mysql: prompt with color:
-- export MYSQL_PS1="$(echo -e '\033[1;32mmysql \d> \033[0m')";
-- mysql: prompt format to "mysql[selected_db_name]>"
-- prompt mysql[\d]>\_
```
```sql
--  mysql: export data to file with console:
SELECT * FROM test INTO OUTFILE '/tmp/dbi.data';
```
```sql
--  mysql: find user:
SELECT * FROM MYSQL.user;
```
```sql
--  mysql: create user:
CREATE USER 'abhinickz' IDENTIFIED BY 'XXXXXX';
```
```sql
--  mysql: different examples loading data to table:
LOAD DATA INFILE '/tmp/TEST.data' INTO TABLE test CHARACTER SET utf8 FIELDS TERMINATED BY "\t" ENCLOSED BY 'þ';
LOAD DATA LOCAL INFILE '/tmp/test.csv' INTO TABLE stats_date_range;
LOAD DATA INFILE '/tmp/test.csv' INTO TABLE stats_date_range;
```
```sql
--  postgres: CASE syntax:
SELECT
    meta_id,
    (CASE WHEN string_value = 'abhinickz, DEV' THEN 1 ELSE 2 END ) number_value,
    (CASE WHEN string_value = 'abhinickz, INT' THEN 'INT' ELSE 'DEV' END ) string_value
FROM postgres_test;
```
```sql
--  postgres: check progress:
SELECT ROUND( ( COUNT(*) / 3727241 ) * 100, 2 ) || '% done'
FROM abhinickz_dev;
```
```sql
--  postgres: EXPLAIN with ANALYZE and COSTS parameters With YAML param format:
EXPLAIN ( ANALYZE TRUE, COSTS TRUE, BUFFERS TRUE, FORMAT YAML ) 
SELECT 1;
--            QUERY PLAN
-- --------------------------------
--  - Plan:                       +
--      Node Type: "Result"       +
--      Parallel Aware: false     +
--      Async Capable: false      +
--      Startup Cost: 0.00        +
--      Total Cost: 0.01          +
--      Plan Rows: 1              +
--      Plan Width: 4             +
--      Actual Startup Time: 0.002+
--      Actual Total Time: 0.004  +
--      Actual Rows: 1            +
--      Actual Loops: 1           +
--      Shared Hit Blocks: 0      +
--      Shared Read Blocks: 0     +
--      Shared Dirtied Blocks: 0  +
--      Shared Written Blocks: 0  +
--      Local Hit Blocks: 0       +
--      Local Read Blocks: 0      +
--      Local Dirtied Blocks: 0   +
--      Local Written Blocks: 0   +
--      Temp Read Blocks: 0       +
--      Temp Written Blocks: 0    +
--    Planning:                   +
--      Shared Hit Blocks: 3      +
--      Shared Read Blocks: 0     +
--      Shared Dirtied Blocks: 0  +
--      Shared Written Blocks: 0  +
--      Local Hit Blocks: 0       +
--      Local Read Blocks: 0      +
--      Local Dirtied Blocks: 0   +
--      Local Written Blocks: 0   +
--      Temp Read Blocks: 0       +
--      Temp Written Blocks: 0    +
--    Planning Time: 0.045        +
--    Triggers:                   +
--    Execution Time: 0.033
```
```sql
--  postgres: index tip:
-- Indexes can only be used from left to right side. If the first index column is not in the where clause, the index is of little help.
```
```sql
--  postgres: create hot cache:
CREATE EXTENSION pg_prewarm;
SELECT pg_prewarm( 'data_dev' );
```
```sql
--  postgres: lock serially for each request:
SELECT pg_advisory_lock(123);
--  postgres: try or fail:
SELECT pg_try_advisory_lock(123);
--  postgres: unlock:
SELECT pg_advisory_unlock(123); 
```
```sql
--  postgres: check locks:
SELECT * FROM pg_locks;
-- ┌────────────┬──────────┬──────────┬──────┬───────┬────────────┬───────────────┬─────────┬───────┬──────────┬────────────────────┬─────┬─────────────────┬─────────┬──────────┐
-- │  locktype  │ database │ relation │ page │ tuple │ virtualxid │ transactionid │ classid │ objid │ objsubid │ virtualtransaction │ pid │      mode       │ granted │ fastpath │
-- ╞════════════╪══════════╪══════════╪══════╪═══════╪════════════╪═══════════════╪═════════╪═══════╪══════════╪════════════════════╪═════╪═════════════════╪═════════╪══════════╡
-- │ relation   │  2341869 │    12143 │ NULL │  NULL │ NULL       │          NULL │    NULL │  NULL │     NULL │ 7/310              │ 815 │ AccessShareLock │ t       │ t        │
-- │ virtualxid │     NULL │     NULL │ NULL │  NULL │ 7/310      │          NULL │    NULL │  NULL │     NULL │ 7/310              │ 815 │ ExclusiveLock   │ t       │ t        │
-- │ advisory   │  2341869 │     NULL │ NULL │  NULL │ NULL       │          NULL │       0 │    12 │        1 │ 7/310              │ 815 │ ExclusiveLock   │ t       │ f        │
-- │ advisory   │  2341869 │     NULL │ NULL │  NULL │ NULL       │          NULL │       0 │   123 │        1 │ 7/310              │ 815 │ ExclusiveLock   │ t       │ f        │
-- └────────────┴──────────┴──────────┴──────┴───────┴────────────┴───────────────┴─────────┴───────┴──────────┴────────────────────┴─────┴─────────────────┴─────────┴──────────┘
```
```sql
--  postgres: DROP FUNCTION: get all function:
SELECT 'DROP FUNCTION ' || oid::regprocedure FROM pg_proc WHERE proname = 'cal_data' AND pg_function_is_visible(oid);
-- DROP FUNCTION cal_data(smallint,integer);
-- DROP FUNCTION cal_data(smallint,integer,text);
```
```sql
--  postgres: DROP all FUNCTION:
CREATE OR REPLACE FUNCTION data.delete_all_functions(schema_in TEXT)
    RETURNS VOID AS
$$
DECLARE
    qry TEXT;

BEGIN
    SELECT INTO qry string_agg(
       format(
          CASE WHEN proname = 'delete_all_functions' THEN '-- %s;' -- don't delete self
               WHEN proisagg THEN 'drop aggregate if exists %s cascade;'
               ELSE 'drop function if exists %s cascade;'
             END,
          oid :: regprocedure
          ),
       E'\n'
        )
    FROM pg_proc
    WHERE pronamespace = schema_in :: regnamespace;

    IF qry IS NOT NULL THEN
        EXECUTE qry;
        RAISE NOTICE 'deleted all functions in schema: %', schema_in;
    ELSE
        RAISE NOTICE 'no functions to delete in schema: %', schema_in;
    END IF;
END
$$
LANGUAGE plpgsql;
```
```sql
--  postgres: convert column to string:
SELECT string_agg(id::TEXT, ', ') FROM ids;
```
```sql
--  postgres: check hot/cold cache buffer:
CREATE EXTENSION pg_buffercache;
```
```sql
--  postgres: DB wise cache:
SELECT
    CASE WHEN c.reldatabase IS NULL THEN ''
    WHEN c.reldatabase = 0 THEN ''
    ELSE d.datname
    END AS database,
    count(*) AS cached_blocks
FROM pg_buffercache AS c
LEFT JOIN pg_database AS d ON c.reldatabase = d.oid
GROUP BY d.datname, c.reldatabase
ORDER BY d.datname, c.reldatabase;
-- ┌───────────────────────────────┐
-- │   database    │ cached_blocks │
-- ╞═══════════════╪═══════════════╡
-- │ abhinickz_int │           149 │
-- │ abhinickz_dev │            88 │
-- └───────────────────────────────┘
```
```sql
--  postgres: TABLE wise cache:
SELECT
    c.relname, c.relkind, count(*)
FROM pg_database AS a, pg_buffercache AS b, pg_class AS c
WHERE c.relfilenode = b.relfilenode
AND b.reldatabase = a.oid
AND c.oid >= 16384
AND a.datname = 'abhinickz_int'
GROUP BY 1, 2
ORDER BY 3 DESC, 1 LIMIT 5;
-- ┌──────────┬─────────┬───────┐
-- │ relname  │ relkind │ count │
-- ╞══════════╪═════════╪═══════╡
-- │ user     │ r       │    28 │
-- └──────────┴─────────┴───────┘
```
---
```powershell
#   windows: cmd: ip release and renew:
ipconfig /release
ipconfig /renew
```
```powershell
#   windows: cmd: find command:
findstr /s "SECURITY" *.SQL
```
```powershell
#   windows: cmd: service ssh service:
net stop sshd
```
```powershell
#   windows: cmd: kill muliple process and service forcefully:
TASKKILL /F /PID 5900 /PID 5901
```
```powershell
#   windows: cmd: find windows process && service PID:
TASKLIST
```
```powershell
#   windows: run powershell script bypassing execution policy:
powershell -ExecutionPolicy Bypass -File I:\scripts\access_wsl.ps1
```
---
```python
#   python: install module:
pip install ppm
```
```python
python -c "import pip; print(pip.__version__)"
# 20.3.4
```
```python
python -m site
# sys.path = [
#     '/tmp',
#     '/usr/lib/python39.zip',
#     '/usr/lib/python3.9',
#     '/usr/lib/python3.9/lib-dynload',
#     '/home/abhinickz/.local/lib/python3.9/site-packages',
#     '/usr/local/lib/python3.9/dist-packages',
#     '/usr/lib/python3/dist-packages',
#     '/usr/lib/python3.9/dist-packages',
# ]
# USER_BASE: '/home/abhinickz/.local' (exists)
# USER_SITE: '/home/abhinickz/.local/lib/python3.9/site-packages' (exists)
# ENABLE_USER_SITE: True
```
---
```javascript
// js: debug: caller function:
console.log("caller is " + arguments.callee.caller.toString());
```
```javascript
//   js: debug: console error: example:
window.onerror = function(error) {
    console.log(error);
};
```
```javascript
//  js: get IFrame child elements:
document.getElementById("DEV_IFRAME").contentWindow.document.getElementById("DEV").value;
```
```javascript
//  js: get epoch time:
Math.round((new Date()).getTime() / 1000);
// 1664986056
```
```javascript
// js: close chrome window after 1200 sec:
window.setTimeout(function() {
    var win = window.open("about:blank", "_self");
    win.close();
}, 1200000);
```
```javascript
// js: bookmarklet for login:
javascript: (() => {
    const url = 'https://dev-server:8443/Login.html';
    if (location.href !== url) return (location.href = url);
    document.querySelector('input#login_username').value = 'user_name';
    document.querySelectorAll('input[type="password"]')[0].value = 'XXXXX';
    document.querySelector('#button').click();
})();
```