#! /usr/bin/env python3
# -*- coding: UTF-8 -*-

# 寄信功能

import sys, logging ,getopt

from mail import sendmail

helpContent="sendMail.py -a <mailAccount> -p <mailPassword> -f <mailFrom> -t <mailTo> -s <latestMailPath>"
logging.basicConfig(stream=sys.stderr, encoding='utf-8',level=logging.DEBUG,format='%(asctime)s %(message)s',datefmt='%Y-%m-%d %H:%M:%S')

def main(argv):

   mailAccount = ''
   mailPassword = ''
   mailFrom = ''
   mailTo = ''

   try:
      opts, args = getopt.getopt(argv,"ha:p:f:t:s:c:",[
         "mailAccount=","imailPassword=",
         "mailFrom=","mailTo=",
         "mailSubject=","mailContent="
         ])
   except getopt.GetoptError as e:
      logging.error(e)
      sys.exit(2)
   for opt, arg in opts:
      if opt == '-h':
         print(helpContent)
         sys.exit()
      elif opt in ("-a", "--mailAccount"):
         mailAccount = arg
      elif opt in ("-p", "--imailPassword"):
         mailPassword = arg
      elif opt in ("-f", "--mailFrom"):
         mailFrom = arg
      elif opt in ("-t", "--mailTo"):
         mailTo = arg
      elif opt in ("-s", "--latestMailPath"):
         latestMailPath = arg
         
   sendmail(mailAccount,mailPassword,mailFrom,mailTo,latestMailPath)

if __name__ == "__main__":
   main(sys.argv[1:])