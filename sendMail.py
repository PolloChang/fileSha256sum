#! /usr/bin/env python3
# -*- coding: UTF-8 -*-

import sys, logging ,getopt

from lib.mail import sendmail

helpContent="sendMail.py -a <mailAccount> -p <mailPassword> -f <mailFrom> -t <mailTo>"
logging.basicConfig(stream=sys.stderr, encoding='utf-8',level=logging.DEBUG,format='%(asctime)s %(message)s',datefmt='%Y-%m-%d %H:%M:%S')

def main(argv):

   mailAccount = ''
   mailPassword = ''
   mailFrom = ''
   mailTo = ''

   try:
      opts, args = getopt.getopt(argv,"ha:p:f:t:",[
         "mailAccount=","imailPassword=",
         "mailFrom=","mailTo="
         ])
   except getopt.GetoptError as e:
      print(helpContent)
      logging.error(e)
      sys.exit(2)
   for opt, arg in opts:
      print(opt)
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

   logging.debug('mailAccount:'+mailAccount)
   logging.debug('mailPassword:'+ mailPassword)
   logging.debug('mailFrom:'+ mailFrom)
   logging.debug('mailTo:'+ mailTo)

   sendmail(mailAccount,mailPassword,mailFrom,mailTo)

if __name__ == "__main__":
   main(sys.argv[1:])