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
DIFF=$(diff -u `ls -t sha256sum/*.sha256 | head -2`) 
if [ "$DIFF" != "" ] 
then
    echo "檔案有被更動過"
    echo "$DIFF"
fi