#!/bin/bash
#===============================================================================
#
#          FILE:  compareTwoFiles.sh
# 
#         USAGE:  ./compareTwoFiles.sh 
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
#       CREATED:  06/28/2023 10:49:08 AM CST
#      REVISION:  ---
#===============================================================================

export startTime=$(date '+%Y-%m-%d %H:%M:%S')

function getProjectConfig {
    grep "${1}" *.properties |cut -d'=' -f2
}

export basedir=$(getProjectConfig 'localPath')  # 專案環境目錄
export libDirL=${basedir}/lib

for libDirI in "$libDirL"/*.sh
do
  source ${libDirI}
done

zc_log INFO "sha256 files"

export dateS=`date +%Y%m%d%H%M%S`
export SHA256SUMS=${dateS}".sha256"
export SHA256SUMSFile="$basedir/sha256sum/${SHA256SUMS}"

sha256sumFiles $(prop 'startPath') ${SHA256SUMSFile}

zc_log INFO "compareTwoFiles"

compareTwoFiles $basedir

val=$?
# $(prop 'startPath')
insertMailContent "機關名稱=$(prop orgName)"
insertMailContent "系統名稱=$(prop systemName)"
insertMailContent "主機名稱=$(prop hostName)"
insertMailContent "完整性驗證=${val}"
insertMailContent "執行開始時間=${startTime}"
insertMailContent "執行結束時間=$(date '+%Y-%m-%d %H:%M:%S')"

export latestMailPath=`ls -t ${basedir}/mails/*.mail | head -1`

export mailContent=$(<$latestMailPath)

zc_log INFO "sendMail"

export mailSubject="$(prop orgName)-$(prop systemName)-$(prop hostName)-完整性驗證"
echo ${mailContent}
$basedir/sendMail.py -a $(prop mailAccount) -p $(prop mailPassword) -f $(prop mailFrom) -t $(prop mailTo) -s ${mailSubject} -c ${mailContent}

zc_log INFO "finish"