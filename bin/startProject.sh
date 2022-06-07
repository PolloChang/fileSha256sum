#!/bin/bash
#===============================================================================
#
#          FILE:  startProject.sh
# 
#         USAGE:  ./startProject.sh 
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  PolloChang (), jameschangwork@gmail.com
#       COMPANY:  Open Source Corporation
#       VERSION:  1.0
#       CREATED:  03/03/2022 10:49:08 AM CST
#      REVISION:  ---
#===============================================================================


chmod +x lib/*.sh
chmod +x ./*.sh

touch config/notExistsFiles.txt
echo "startPath=/var/log \n SHA256SUMS=SHA256SUMS" > config/settings.properies
echo "localPath=[請輸入你的專案絕對路徑]" > projection.properties
touch log/checkWbsite.log
