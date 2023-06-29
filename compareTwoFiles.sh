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
#       CREATED:  06/27/2023 10:49:08 AM CST
#      REVISION:  ---
#===============================================================================

# 更多選項
# diff -y --suppress-common-lines sha256sum/*.sha256
# diff -u sha256sum/*.sha256

# 只比對兩個最新的檔案
DIFF=$(diff -U 0 `ls -t sha256sum/*.sha256 | head -2`| grep -v '^@@'| grep -v '^---' | grep -v '^+++'| wc -l) 
val=`expr $DIFF / 2`

echo 機關名稱="XXX"
echo 系統名稱="XXX"
echo 主機名稱="XXX"
echo 完整性驗證="${val}"
echo 執行開始時間="$(date '+%Y-%m-%d %H:%M:%S')"
echo 執行結束時間="$(date '+%Y-%m-%d %H:%M:%S')"