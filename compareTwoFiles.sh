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

# sha256sumFiles $(prop 'startPath') ${SHA256SUMSFile}

cat ${basedir}/config/fileList.txt | while read rows
do
  zc_log INFO "sha256 path: $rows"
  sha256sumFiles $rows ${SHA256SUMSFile}
done

zc_log INFO "compareTwoFiles"

compareTwoFiles $basedir

val=$?

zc_log INFO "create mail content"

insertMailContent "機關名稱=\"$(prop orgName)\""
insertMailContent "系統名稱=\"$(prop systemName)\""
insertMailContent "主機名稱=\"$(prop hostName)\""
insertMailContent "完整性驗證=\"${val}\""
insertMailContent "執行開始時間=\"${startTime}\""
insertMailContent "執行結束時間=\"$(date '+%Y-%m-%d %H:%M:%S')\""

mv ${mail} $basedir/mails/$(prop orgName)-$(prop systemName)-$(prop hostName)-完整性驗證."`date +%Y%m%d%H%M%S`".mail

zc_log INFO "finish"