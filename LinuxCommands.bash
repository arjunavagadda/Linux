#adduser

useradd [OPTIONS] USERNAME
- useradd -G <> username 
    useradd -G <nautilus_admin_users> mohammed
- useradd -M test_user = -M flag no home directory 
- useradd -u <1120> <username> 
id username
id anita == cd /etc/passwd
usermod -d /var/www/anita -m anita == modify user details
grep username /etc/passwd
userdel username
id mohammed
groupadd nautilus_admin_users
id <>
usermod -aG <grpname> <username> - always give 'a' parameter which appends the user name to the groups
passwd <username> 

#user with expiry

chage -l mark
chage -E 2021-04-15 mark

#sudo user
visudo - add users to sudo list
sudo cat /etc/sudoers | grep jim

ssh usrname@<servername>
ssh -i "arjuntest.pem" ec2-user@ec2-35-154-94-64.ap-south-1.compute.amazonaws.com

ssh -t tony@stapp01 "cat /opt/dba/blog.txt"  

ssh -p port tony@stapp01 ---> if ssh running on another port

systemctl start service

systemctl status service 

## yum

yum install
yum remove <packagename> 

yum search <packname>

yum info <package>

yum repolist

yum list

yum install   epel-release -y

== EPEL (Extra Packages for Enterprise Linux) is an open-source and free community-based repository project from Fedora team



crontab -u root -l = -l : list cron for  -u: user

crontab -e = edit cron file


#

hostname

hostname -i ---> gives only the IP

whoami

ifconfig


systemctl status firewalld

firewall-cmd --list-all --zone=public

firewall-cmd --permanent --zone=public --add-port=6200/tcp

firewall-cmd --reload

systemctl restart firewalld

ls -a > shows all files

nano <filename> , vi <filename> ,  vim <filename> -> editors

touch <filename> - to create files

touch -t 201501010930 datez

https://www.geeksforgeeks.org/touch-command-in-linux-with-examples/

cat <filename>

cat -n <file> ---> gives the line numbers

tac <file> --> reverses the file

more --> displays in percentage of the file

more -s -----> supress the spaces

less   --->> type 'b' to scross backward 'spacebar' to forward

lsblk - lists blocks

fdisk - utility for partition

df -h -> diskspace

df -i --> inode

du -sh /var --> folder size  ===> s - summarize

du -ah ==> all files

findmnt ---> shows all the storage mounts

fdisk ---> total sidk size


free = shows available space

ifconfig

ipconfig - windows ip address

pwd 

~  -- home dir


ctrl+R - reverse search

#banner- when login first time



/tmp to /etc/motd(message of today) 
sudo yum install openssh-clients == for db servers file cant be tranferred 


cd ../..

cd - >> move to the prev folder

/tmp - files can be created without root but files will be lost after boot

grep - search

uptime - when did the server up and running

last reboot - when the system last rebooted

ps -ef --> diffrent process running on server
    e - all the process 
	f - full formating

pstree ---> shows all the processes in tree structure

pmap -x <processid> ---> shows memory usage of the process
	
ps -aef --> active process

ps -ef  |grep sendmail

kill 615

ssh-keygen - create public and private keys

nano sshd_config

history -c - clears all history

history then !3 - runs the 3rd command




aws - hostname change = /etc/sysconfig/network

/etc/hosts - 

cat /etc/hosts    ---> host details
cat /etc/resolv.conf ----> DNS
cat /etc/nsswitch.conf  ----> hosts - file dns(checks file then DNS)




-- >  grep -lR -f file.txt .|xargs rm --> 

haproxy -f /etc/haproxy/haproxy.cfg -c  - verify the config file 
--> def: HAProxy such as Apache or Nginx, and HAProxy can be installed in front of them to provide load balancing and high availability

file -s /dev/xvdf - file type

mkfs -t ext4 /dev/xvdf - to change into linux file system 

mount - attach volume to directory

resize2fs - ext2/ext3/ext4 file system resizer

awk - 

cat /etc/shadow - pwd file

cat /etc/ssh/sshd_config

ssh-keygen -A - generate default key



cat /etc/groups - list of groups

groups

visudo - edit the file to gain sudo access



find / -name *crontab

find /etc -size +1M

find /etc -mtime +90

find /var/www/my_website -type f -exec chmod 644 {} \;



locate <filename> ----> similar to find

crontab -l = list 

crontab -e = edit

crontab -r = remove 

cat /etc/motd = message today


> - overwrite

>> - append

ping -c = count

ping -q = quit



grep -i = search

telnet - similar to ping

telnet stapp01 8087

netstat -a | grep -i  >> which ports open

netstat -tnlp = tcp ports l>> running

netstat -tulnp

The ss command is a modern replacement for the classic netstat



unzip - unzip <filename>


#network trouble shooting::

1.route -n
2.host 
3.nslookup <site> - check in harsha amazon videos
4.curl -s = silent mode o/p can be assigned to a variable in shell script
5.wget = only download
#dig - querying dns servers
traceroute - shows complete traffic flow
top - utilization
** htop - yum install htop = simlar to top but visualisation look
** stress - yum insall stress = increases cpu and memory ( amazon linux diffrent installation )
##iptraf - iptraffic
wireshark - check youtube videos 


last ---> gives all the users and ips who logged in and reboot details etc
<><><><>



type <command>

help <command> = shell commands


http://169.254.169.254/latest/meta-data/hostname

#shellscripting::

- echo $var1 / echo ${var1}
- var1=$() / var1=``

- which ls = /usr/bin/ls

- $PATH = similar to windows path

    /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin


- tree = yum install tree > shows tree structure

- hash = cache into memory ( shows how many times - a command hit)
- hash -r == remove entire hash

grep 'May' = gives May files

grep -v 'May' = other than may

grep -i 'may' = ignore case ( gives both upper and lower cases)

nslookup = name server lookup

nslookup <google.com> -


systemctl status nfs-server && systemctl status rpcbinde 

/etc/exportfs

systemctl start nfs-server && systemctl start rpcbind

exportfs -av

showmount -e ststor01 

uptime : aws how much time instance is up 

#SCP::

scp - secure copy
sudo scp /<location> banner@stapp:/tmp/

scp -r /home/thor tony@stapp01:/tmp === copies file from jump server to other

pscp <windows> root@ip:/home -----> copies files from windows to linux machine

mv /tmp /home

https://linuxize.com/post/how-to-use-scp-command-to-securely-transfer-files/

#rsync

rsync -P username@host:/path/to/file .

--> The -P option preserves partially downloaded files and also shows progress.

rsync -a == archive mode
rsync -r == recursive

rsync -z === compress file data during transfer-files/


#SED::

https://www.geeksforgeeks.org/sed-command-in-linux-unix-with-examples/

SED command in UNIX is stands for stream editor and it can perform lot’s of function on file like, searching, find and replace, insertion or deletion

sed -i 's/About/Cloud/g' /root/nautilus.xml

>> -i option indicate in-place editing. Then changes will not be returned to the screen, but will be saved to the file.

#DNS resolution::

cat /etc/resolv.conf  - this file need to be edited if we want to add dns names (e.g., google dns 8.8.8 etc..)

##Vi editor::

:14 - to go to 14th line

##Zip//unZip::

tar -czvf <filename.tar> <file2_be_archived>  == to create zip

tar xvzf == to extract


~ >> /root

:: <><><>< ::

jounalctl -xe -u <servicename>

## ssh keygen SSH Login Without Password Using ssh-keygen & ssh-copy-id::

ssh-keygen -t rsa = Specifies the type of key to create. The possible values are ''rsa1'' for protocol version 1 and ''                    rsa'' or ''dsa'' for protocol version 2.


ssh-copy-id  tony@stapp01 = ssh-copy-id appends the keys to the remote-host’s .ssh/authorized_key.


##disable direct ssh root login::

cat /etc/ssh/sshd_config | grep Permit - modify >>  PermitRootLogin no
systemctl restart ssh


----------------------

##ansible inventory file

ansible-target-1 ansible_host=172.31.40.50 ansible_connection=ssh ansible_user=ec2-user

ssh:

ssh-agent bash
cp <pemfile> /root/.ssh
change permissions = chmod 400
ssh-add /root/.ssh/<pemfile>




## export set and unset

export PATH="/home/ec2-user:$PATH"

env | grep DUALCASE

unset DUALCASE

##mailservic -postfix

cat /etc/postfix/main.cf
- telnet stmail01 25 - mail server on port 25


https://www.youtube.com/watch?v=HmG6g0ujhJc




#ntp server

rpm -qa = list rpm packages

rpm -e <pkname> === removes the package
yum list openssh
yum list openssh

vi /etc/ntp.conf == add ntp server file

https://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/

https://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/

https://www.vmware.com/support/vcm/doc/help/vcm-57/Content/ProvisioningHW/ProvHW_GS_Task_Provision_UNIX_ntp.htm

#ssh - putty

echo 'ClientAliveInterval 60' >> /etc/ssh/sshd_config Or uncomment #ClientAliveInterval

#runlevel

systemctl get-default
systemctl set-default graphical.target

cat /etc/inittab

systemctl get-default - by default "multi-user.target" 

systemctl set-default graphical.target 
- Graphical login is now enabled by default - you will be presented with a "graphical login" prompt after the next reboot



#find and copy

find /var/www/html/ecommerce -type f -name '*.js' -exec cp -rPp --parents {} /ecommerce \; 

find /home/shantanu/processed/ -name '*2011*.xml' -exec cp "{}" /home/shantanu/tosend  \;

- the find command use {} as placeholder for matched file

https://man7.org/linux/man-pages/man1/cp.1.html

##flush dns

- ipconfig/flushdns



#copy

cp -rpP 

#java

export PATH=$JAVA_HOME/bin:$PATH


#httpd

systemctl start httpd
systemctl status  httpd.service
cat -n  /etc/httpd/conf/httpd.conf  | grep 31

https://stackoverflow.com/questions/9000853/apache-how-to-hide-server-version-and-operation-system-from-users
https://stackoverflow.com/questions/2530372/how-do-i-disable-directory-browsing

https://www.nbtechsupport.co.in/2021/01/web-server-security-apache-kodekloud.html

https://www.nbtechsupport.co.in/2021/07/add-response-headers-in-apache.html


## nginx

cat /etc/nginx/nginx.conf



## boot process

https://www.thegeekstuff.com/2011/02/linux-boot-process/

https://www.youtube.com/watch?v=x9WXE99mHvA

##directories file permission

chgrp -R devops /devops/data
-R = recursive . changes will reflect all sub-directories and files below.
chmod -R 2770 /devops/data
 2 - Special Permission. set group id.
 
 #mariadb 

chown [OPTION] [OWNER][:[GROUP]] <FILE>
chown mysql:mysql /var/run/mariadb/

For any service not only maria-db always go through the logs where you get clear view.  In case of Mariadb Check /var/log/mariadb/mariadb.log for errors


## Apche redirect

vi /etc/httpd/conf/httpd.conf ==> listening port

vi /etc/httpd/conf.d/main.conf ==> for redirect we will create conf file

https://stackoverflow.com/questions/4596066/how-to-config-apache2-to-redirect-url/33258022


## rpm packages

https://www.tecmint.com/20-practical-examples-of-rpm-commands-in-linux/

rpm -qa = list all packages

##alias

alias ll="ls -al"
cat ~/.bashrc

## logrotate

yum update && yum install logrotate

https://www.tecmint.com/install-logrotate-to-manage-log-rotation-in-linux/

/var/log/apache2/* {
    weekly
    rotate 3
    size 10M
    compress
    delaycompress
}



## gpg encryption

https://www.howtogeek.com/427982/how-to-encrypt-and-decrypt-files-with-gpg-on-linux/


gpg --full-generate-key

gpg --import mary-geek.key

gpg --list-keys

gpg --list-secret-keys

gpg --encrypt -r kodekloud@kodekloud.com --armor < encrypt_me.txt  -o encrypted_me.asc

gpg --decrypt decrypt_me.asc > decrypted_me.txt

gpg --output ~/dave-geek.key --armor --export dave-geek@protonmail.com

##apt packages

- apt list --installed

#env var

env

## repolist

yum repolist   

vi /etc/yum.repos.d/local_yum.repo

[local_yum]
name=local_yum
baseurl=file:///packages/downloaded_rpms/
enabled = 1
gpgcheck = 0


#Tomcat

yum install -y tomcat

vi /usr/share/tomcat/conf/server.xml

   <Connector port="5001" protocol="HTTP/1.1"

               port="5001" protocol="HTTP/1.1"

    <!-- Define a SSL HTTP/1.1 Connector on port 8443

    <Connector port="8443" protocol="org.apache.coyote.http11.Http11Protocol"

    <!-- Define an AJP 1.3 Connector on port 8009 -->
	
	
cp /tmp/ROOT.war /usr/share/tomcat/webapps


## iptables

## linux TrieTree

- /proc >> whole info about cpu memory lie here

## expr

expr 2 \* 3

## multiple commands

ll ; date

echo "`date`"
 
#alias

alias favball="cd /home/ec2-user/arj/rmp ; ll"

unalias favball

alias --> gives the list of alias

cat .bashrc --> permanent alias (/root)

# mkdir

mkdir -p arj/child ---> p argument is important..


## word count

cat dump | wc --> gives lines words characters

cat dump | wc -l --> gives lines

cat dump | wc -c --> characters


cat dump | wc -w --> words


wc * --> gives all the files line count in the directory


watch tail /var/log/jenkins/log --> it updates for every 2sec

tail -F --> updates every


#tee command reads the standard input and writes it to both the standard output and one or more files

tee --> wc -l file1.txt| tee file2.txt

basename "$PWD" --> gives the o/p only last name of the dir

pwd | rev | cut -d "/" -f 1 | rev

#nohup

Every command in Linux starts a process at the time of its execution, which automatically gets terminated upon exiting the terminal. Suppose, you are executing programs over SSH and if the connection drops, the session will be terminated, all the executed processes will stop, and you may face a huge accidental crisis. In such cases, running commands in the background can be very helpful to the user and this is where nohup command comes into the picture. nohup (No Hang Up) is a command in Linux systems that runs the process even after logging out from the shell/terminal. 


nohup & ->> runs background and outputs to nohup.out

cut test.txt -d ':' -f 1,3 -- display the 1st and 3rd fields using “:” as a delimiter


## shell script

grep uniq sort 

grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" logfile | sort | uniq -c | sort -nr

exit status - echo $? >>> if the prev command is sucesss return zero , if the prev command is failure return non zero some random number

$0 -- positional parmeter >> which gives the file name

shell - it will take input from the console

echo $0 -> which shell

>> myname=arjun
echo $myname
- global varibles must be in capitals

- single quotes and double quotes they work normally, 
- if we r using var inside var single quotes wont work

>> if u open bash inside a bash the var cant be called

- echo $$PPID -- give parent process id

>> readonly varread=arjun

- read only varibles, they can not be changed

>> unset arjun - unset varible name

>> export $varname - we can use in other bash

>> env - environment varibles

>> echo $SHLVL - how many u r into shell levels

>> bash -version == version 4.2.46

>> cd ---> home directory /home/ec2-user

>> ls file[0-2]
  ls fil[a-f][0-9]
  ls fil?? ---> file1 file2 file3
  ls fil??? ---> no such directory
  ls fi*
  
>>> grep -c text -- gives the count of text

>> stdout - runs in diffrent file
   stderr 
   -- grep works only on stdput
   
-- I/O redirection

 1>filename
      # Redirect stdout to file "filename."
   1>>filename
      # Redirect and append stdout to file "filename."
   2>filename
      # Redirect stderr to file "filename."
   2>>filename
      # Redirect and append stderr to file "filename."
   &>filename
      # Redirect both stdout and stderr to file "filename."
      # This operator is now functional, as of Bash 4, final release.
	>

echo "$(hostname)" 

- naming conventions and file permission 

## shell script

- relative path --> ./test.sh
- absolute path --> whole path - /root/scripts

iostat - gives read and write details

sh admin.sh



-eq == does not work for string

file check

https://www.cyberciti.biz/tips/find-out-if-file-exists-with-conditional-expressions.html

-e: Returns true value if file exists.
-f: Return true value if file exists and regular file.
-r: Return true value if file exists and is readable.
-w: Return true value if file exists and is writable.
-x: Return true value if file exists and is executable.
-d: Return true value if exists and is a directory.

$ [ -f /etc/passwd ] && echo "File exist" || echo "File does not exist"

#!/bin/bash
echo "Bash version ${BASH_VERSION}..." # Bash v4.0+ has inbuilt support for setting up a step value using {START..END..INCREMENT} syntax:
for i in {0..10..2}
  do 
     echo "Welcome $i times"
 done
 
 
 
 # exit status
 
 
0   OK 
1	Catch all for general errors
2	Misuse of shell builtins (according to Bash documentation)
126	Command invoked cannot execute
127	Command not found
128	Invalid argument to exit command
128+n	Fatal error signal “n”
130	Bash script terminated by Control-C
255*	Exit status out of range


grep -i error /var/log/messages | tee error.out


grep <options> <pattern> <file>


## TCP UDP


## boot process

## osi


# Deployment

https://stackoverflow.com/questions/23746038/canary-release-strategy-vs-blue-green

## cpu info

cat /proc/cpuinfo


## boot mess info

dmesg

# gzip

gzip <filename> ===> .gz extension

gzip -c <filename> ===> keeps the original file

gzip -d <.gz>  ===> decompress

gzip -r <folder>  ===> recursive on folders


## hard link and symbolic links(soft links)

hardlink - goes to inode , if we delete the src also the link file exists

>> we can create hardlinks only for files

ln mainfile hard1

ll -i

-----------------------------

symbolic link -- we will refer to src not to inode , so if we delete the souce the link file is useless

- if we move that file to other dir also symbolic links wont work

- we cant create links in dif partitions 

ln -s main symb1

>> both dir and files symbolic links can be created

- symbolic links --- l


pwd
whoami
sudo su -
env
alias
CTRL + R --> reverse search
>
>>
1> -- dentotes standard op
2> -- denotes standard error

/dev/null --- trash

stdin cmd stdout

stderr

grep -R linuxteam /etc 2> /dev/null ( redirecting the error messages to trash)