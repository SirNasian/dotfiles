#!/bin/sh
FILE_BASE=${1:-/tmp/hypr-pass}
FILE_SCRIPT=$FILE_BASE
FILE_USERNAME=${FILE_BASE}.user
FILE_PASSWORD=${FILE_BASE}.pass

> $FILE_SCRIPT
touch $FILE_USERNAME $FILE_PASSWORD
chmod 600 $FILE_SCRIPT $FILE_USERNAME $FILE_PASSWORD
if [ $? != 0 ]; then exit 1; fi

MODE=$(printf "auto\nuser\npass" | fzf)
if [ $? != 0 ]; then exit 1; fi

cd $HOME/.password-store
SELECTED=$(fd . --type f | sed 's/\.gpg$//' | fzf)
if [ $? != 0 ]; then exit 1; fi

USERNAME=$(echo $SELECTED | awk -F/ '{ print $NF }')
PASSWORD=$([ $MODE = 'user' ] || pass $SELECTED)
if [ $? != 0 ]; then exit 1; fi

echo $USERNAME > $FILE_USERNAME
echo $PASSWORD > $FILE_PASSWORD

if [ $MODE = 'auto' ] || [ $MODE = 'user' ]; then echo "ydotool type \"\$(cat $FILE_USERNAME)\"" >> $FILE_SCRIPT; fi
if [ $MODE = 'auto' ]; then echo "ydotool key 15:1 15:0" >> $FILE_SCRIPT; fi
if [ $MODE = 'auto' ] || [ $MODE = 'pass' ]; then echo "ydotool type \"\$(cat $FILE_PASSWORD)\"" >> $FILE_SCRIPT; fi
if [ $MODE = 'auto' ]; then echo "ydotool key 28:1 28:0" >> $FILE_SCRIPT; fi

exit 0
