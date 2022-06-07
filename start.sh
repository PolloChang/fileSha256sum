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
export SHA256SUMS=$(prop 'SHA256SUMS')
export findL=$(find ${startPath} -exec ls -l \{\} \; | grep -v ^d | awk '{print $9}')
export fileL
export listN=0
export SHA256SUMSFile="$basedir/${SHA256SUMS}"

zc_log INFO "start 2"

for listI in $findL ;
do
    notExistsFile=0

    while read notExistsFileI ; do

        pat="${notExistsFileI}$"
    
        if [[ $listI =~ $pat ]]; then
            notExistsFile=$[ $notExistsFile + 1 ]
        fi

    done < $notExistsFileL

    if [ -n "$listI" ] && [ $notExistsFile == 0 ]; then
        fileL[$listN]="$listI"
        listN=$[ $listN + 1 ]

    fi
done

zc_log INFO "start 3. check ${SHA256SUMSFile}"

for fileI in ${fileL[@]}
do

    fileI=${fileI//"${startPath}"/""}

    FIND_STR="${startPath}/$fileI"

    if [ -f "${FIND_STR}" ]; then

        a=`grep -c "$FIND_STR" $SHA256SUMSFile`

        if [ "${a}" == "0" ];then
            sha256sum ${FIND_STR} >> "${SHA256SUMSFile}"
            if [ $? -ne 0 ]; then
                zc_log ERROR ""
            fi
        fi 
        
    else
        zc_log WARN "不存在:${fileI}"
    fi
    
done


zc_log INFO "finish"