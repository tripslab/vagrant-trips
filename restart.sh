#!/bin/bash


LOG_FILES="IM.log LXM.log PARSER.log WEBPARSER.log facilitator.err facilitator.log lisp.log"

for i in "$@"
do
case $i in
    -m=*|--module=*)
    compile="${i#*=}"
    shift # past argument=value
    ;;
    --nocompile)
    NOCOMPILE=YES
    shift
    ;;-c|--clean)
    CLEAN=YES
    shift
    ;;
    --noserver)
    NOSERVER=YES
    shift # past argument with no value
    ;;
    --log)
    LOG=YES
    shift # past argument with no value
    ;;
    *)
          # unknown option
    ;;
esac
done

if [ -z $NOCOMPILE ];
then
	vagrant reload 
	if [ -z $CLEAN ];
	then
		vagrant ssh -c "cd /home/vagrant/shared/$SYSTEM_NAME/src/$compile && make && sudo make install"
	else
		vagrant ssh -c "cd /home/vagrant/shared/$SYSTEM_NAME/src/$compile && make clean && make && sudo make install"
	fi
fi


if [ -z $NOSERVER ];
then
	vagrant reload && vagrant ssh -c 'sudo /home/vagrant/shared/run_lighttpd.sh'
fi

sleep 30; 

command -v terminal-notifier && terminal-notifier -message "Compilation complete" -title "Trips Compiled"

if [ -n $LOG ];
then
	pushd shared/logs && multitail -s 3 $LOG_FILES && popd
fi
