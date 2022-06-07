#!/bin/bash
#===============================================================================
#
#          FILE:  log.sh
# 
#         USAGE:  ./log.sh 
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
#       CREATED:  03/03/2022 10:38:18 AM CST
#      REVISION:  ---
#===============================================================================


#日誌名稱
# Logging Level 的優先順序
# ALL < TRACE < DEBUG < INFO < WARN < ERROR < FATAL < OFF

exec 2>>$log  #如果執行過程中有錯誤資訊均輸出到日誌檔案中 
#日誌函式
#引數
#引數一，級別，INFO ,WARN,ERROR
#引數二，內容
#返回值
function zc_log(){
    
    #判斷格式
    if [ 2 -gt $# ]
    then
        echo "parameter not right in zc_log function" ;
        return ;
    fi

    if [ -e "$log" ]
    then
        touch $log
    fi

    #當前時間
    local curtime;
    curtime=`date +%Y%m%d%H%M%S`

    #判斷檔案大小
    local cursize ;
    cursize=`cat $log | wc -c` ;

    if [ $fsize -lt $cursize ]
    then
        mv $log $curtime".out"
        touch $log ;
    fi

    #寫入檔案
    echo "$curtime $*" >> $log;
} 


