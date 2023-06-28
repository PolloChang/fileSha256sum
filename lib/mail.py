#! /usr/bin/env python3
# -*- coding: UTF-8 -*-

from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib 
import sys, logging


logging.basicConfig(stream=sys.stderr, encoding='utf-8',level=logging.INFO,format='%(asctime)s %(message)s',datefmt='%Y-%m-%d %H:%M:%S')
def sendmail(mailAccount,mailPassword,mailFrom,mailTo):

   content = MIMEMultipart()  #建立MIMEMultipart物件
   content["subject"] = "Learn Code With Mike"  #郵件標題
   content["from"] = mailFrom  #寄件者
   content["to"] = mailTo #收件者
   content.attach(MIMEText("Demo python send email"))  #郵件內容

   # import smtplib
   with smtplib.SMTP(host="smtp.gmail.com", port="587") as smtp:  # 設定SMTP伺服器
      try:
         smtp.ehlo()  # 驗證SMTP伺服器
         smtp.starttls()  # 建立加密傳輸
         smtp.login(mailAccount, mailPassword)  # 登入寄件者gmail
         smtp.send_message(content)  # 寄送郵件
         logging.info("Complete!")
      except Exception as e:
         logging.error(e)