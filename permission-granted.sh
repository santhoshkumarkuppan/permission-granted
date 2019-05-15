#!/bin/bash


#getting host details
echo "enter the host name: (example: ftp://domain.com | sftp://1.2.3.4)"
read host
echo "enter the user name:"
read user
echo "enter the password:"
read password

#connecting to host using lftp
#add your list of files path with the required file privilege.

lftp << EOF
set ftp:ssl-allow no
set ftp:passive-mode true
set ftp:list-options -a

open $host
user $user "$password"

chmod 644 /public_html/example.com/wp-content/themes/twentysixteen/index.php
chmod 740 /public_html/example.com/wp-content/themes/customizr/core/front/models/content/common/media/class-model-thumbnail.php

EOF



