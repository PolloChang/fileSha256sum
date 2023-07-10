#! /usr/bin/env python3
# -*- coding: UTF-8 -*-

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import os
import sys, logging
import smtplib


logging.basicConfig(stream=sys.stderr, encoding='utf-8',level=logging.INFO,format='%(asctime)s %(message)s',datefmt='%Y-%m-%d %H:%M:%S')

def sendmail(mailAccount,mailPassword,mailFrom,mailTo,latestMailPath):
   
   print(latestMailPath)
   f = open(latestMailPath,'r')
   mailSubject = os.path.basename(latestMailPath).split('.')[0]

   mailContent = f.read()

   
   content = MIMEMultipart()  #建立MIMEMultipart物件
   content["subject"] = mailSubject  #郵件標題
   content["from"] = mailFrom  #寄件者
   content["to"] = mailTo #收件者
   content.attach(MIMEText(mailContent))  #郵件內容

   f.close()
   logging.debug("mailSubject: "+mailSubject)
   logging.debug("mailContent: "+mailContent)

   with smtplib.SMTP(host="smtp.gmail.com", port="587") as smtp:  # 設定SMTP伺服器
      try:
         smtp.ehlo()  # 驗證SMTP伺服器
         smtp.starttls()  # 建立加密傳輸
         smtp.login(mailAccount, mailPassword)  # 登入寄件者gmail
         smtp.send_message(content)  # 寄送郵件
         logging.info("Complete!")
      except Exception as e:
         logging.error(e)