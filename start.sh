#! /bin/bin

function getProjectConfig {
    grep "${1}" projection.properties |cut -d'=' -f2
}

export basedir=$(getProjectConfig 'localPath')  # 專案環境目錄

source $basedir/lib/createSource.sh
source $basedir/lib/log.sh
source $basedir/lib/properties.sh

zc_log INFO "start"

export startPath=$(prop 'startPath')
export dateS=`date +%Y%m%d%H%M%S`
export SHA256SUMS=${dateS}".sha256"
export SHA256SUMSFile="$basedir/sha256sum/${SHA256SUMS}"

mkdir -p $basedir/sha256sum

find ${startPath} | xargs sha256sum >> "${SHA256SUMSFile}"

zc_log INFO "start tar.tgz"

/bin/tar zcf "${basedir}/sha256sum/${dateS}".tar.tgz "${SHA256SUMSFile}"

# /bin/rm -f "${SHA256SUMSFile}"

zc_log INFO "finish"