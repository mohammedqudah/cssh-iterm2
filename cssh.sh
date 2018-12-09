#!/bin/bash

SSH=` echo $@|awk '{print $1}'`
FISRT_IP=` echo $@|awk '{print $2}'`
IPS=`echo $@ | sed -e "s/${SSH}//g" -e "s/${FISRT_IP}//g"`

TMP_RUN_SCRIPT=/tmp/$$_macscript

echo ${TMP_RUN_SCRIPT}

cat <<EOF > ${TMP_RUN_SCRIPT}
tell application "iTerm2"
        create window with default profile
                tell current session of current window
                        write text "${SSH} ${FISRT_IP}"
                end tell
EOF


for i in ${IPS}; do 
	echo -e "tell current window\n	create tab with default profile\n	tell current session\n	write text \"${SSH} $i\"\n	end tell\nend tell">>${TMP_RUN_SCRIPT}
done
echo "end tell" >> ${TMP_RUN_SCRIPT}

/usr/bin/osascript ${TMP_RUN_SCRIPT}
