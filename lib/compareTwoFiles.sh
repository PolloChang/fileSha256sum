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

# 更多選項
# diff -y --suppress-common-lines sha256sum/*.sha256
# diff -u sha256sum/*.sha256

function compareTwoFiles(){

  export basedir=${1}

  # 只比對兩個最新的檔案
  DIFF=$(diff -U 0 `ls -t ${basedir}/sha256sum/*.sha256 | head -2`| grep -v '^@@'| grep -v '^---' | grep -v '^+++'| wc -l) 
  val=`expr $DIFF / 2`

  return ${val}
}
