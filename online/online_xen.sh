#!/bin/sh
git_path=/data/git/forum
diff_path=/data/git/forum_diff
desc_path=/data/www/forum-xen
cd $git_path
git pull
start_ver=`cat /data/git/version_xen_sync.log`
end_ver=`git log -1 | head -n 1 | awk '{print $2}'`
cd /data/git
./forum-xen_bak.sh  
./forum_check.sh  $start_ver $end_ver

echo ${start_ver} > /data/git/pre_version_xen_sync.log
./forum-xen_sync.sh $end_ver
