#!/bin/bash


LOG_FILES="IM.log LXM.log PARSER.log WEBPARSER.log facilitator.err facilitator.log lisp.log"

rm shared/logs/*; 
vagrant reload --provision-with=server; 
sleep 30; 
cd shared/logs && multitail -s 3 $LOG_FILES
