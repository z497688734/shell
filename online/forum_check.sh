#!/bin/sh

git_path=/data/git/forum
diff_path=/data/git/forum_diff
desc_path=/data/www/forum-xen

cd $git_path


start_ver="$1"
end_ver="$2"

if [ "$start_ver"x = x ] && [ "$end_ver"y = y ]
then
	echo "Please input version id."
	exit
elif [ "$end_ver"x = x ]
then
	end_ver=`git log -1 | head -n 1 | awk '{print $2}'`
fi

diff_status=`git diff $start_ver $end_ver --name-status`

if [ "$diff_status"x = x ] 
then
	echo "No change file."
	exit
fi

echo "$diff_status"
echo "======================="

diff_modfile=`echo "$diff_status" | awk '$1 !~ /^D/{print $2}'`
diff_rmfile=`echo "$diff_status" | awk '$1 ~ /^D/{print $2}'`

diff_path=/$diff_path/$start_ver-$end_ver
rm -rf $diff_path
mkdir -p $diff_path

for file in $diff_modfile
do
	cp -f --parents $file $diff_path
#	cp -i --parents $file $desc_path
        cp -f --parents $file $desc_path
done

cd $desc_path
for file in $diff_rmfile
do
        rm -i $file
done

