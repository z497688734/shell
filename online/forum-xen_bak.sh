#!/bin/bash

aclpath=/data/sync_cmd

src="/data/www/forum-xen"
dst="/data/git/forum-xen_bak"
if  [ -d ${src} ]
then
        echo -e "\n\033[41;37mbackupinging ...\033[0m"
        rsync -rltgoD --progress --include-from=$aclpath/include --exclude-from=$aclpath/exclude --delete ${src}/ ${dst}
        echo -e "\n\033[41;38mOK, all codes backup done .\033[0m\n"
fi

echo "Please select the version you want to backup."
