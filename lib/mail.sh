function insertMailContent(){

  if [ -e "$mail" ]
  then
      touch $mail
  fi

  #寫入檔案
  echo "$*" >> $mail;
}