# Script used to read Property File
fileName=$propertiesL
# Key in Property File

function prop {
    grep "${1}" $fileName |cut -d'=' -f2
}

