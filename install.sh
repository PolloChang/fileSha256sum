#!/bin/bash
#===============================================================================
#
#          FILE:  install.sh
# 
#         USAGE:  安裝專案
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

mkdir -p {log,config,mails}

# config/settings.properies
echo startPath=[請輸入你要雜湊的路徑] > config/settings.properies
echo mailAccount=example@example.mail.com >> config/mail.properies
echo mailPassword=emailPassword >> config/mail.properies
echo mailFrom=example@example.mail.com >> config/mail.properies
echo mailTo=example@example.mail.com >> config/mail.properies
echo orgName=exampleOrg >> config/mail.properies
echo systemName=exampleSystem >> config/mail.properies
echo hostName=$(hostname) >> config/mail.properies

# projection.properties
echo localPath=`pwd` > projection.properties
