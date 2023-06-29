#!/bin/bash
#===============================================================================
#
#          FILE:  sha256.sh
# 
#         USAGE:  ./lib/sha256.sh 
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
#       CREATED:  06/29/2023 23:49:08 PM CST
#      REVISION:  ---
#===============================================================================

function sha256sumFiles(){
  export startPath=${1}
  export SHA256SUMSFile=${2}
  find ${startPath} | xargs sha256sum >> "${SHA256SUMSFile}"
}

