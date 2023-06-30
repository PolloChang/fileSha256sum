#!/bin/bash
#===============================================================================
#
#          FILE:  寄信功能
# 
#         USAGE:  ./send-mail.sh
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
#       CREATED:  06/30/2023 16:49:08 AM CST
#      REVISION:  ---
#===============================================================================

function getProjectConfig {
    grep "${1}" *.properties |cut -d'=' -f2
}

export basedir=$(getProjectConfig 'localPath')  # 專案環境目錄
export libDirL=${basedir}/lib

for libDirI in "$libDirL"/*.sh
do
  source ${libDirI}
done

zc_log INFO sentMail

export latestMailPath=`ls -t ${basedir}/mails/*.mail | head -1`

$basedir/lib/sendMail.py -a $(prop mailAccount) -p $(prop mailPassword) -f $(prop mailFrom) -t $(prop mailTo) -s ${latestMailPath}

zc_log INFO finish