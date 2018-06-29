#!/bin/bash

line="<tr><td><span title='2018-06-30 11:01:28 -0700'>2018-06-03</span></td><td><a href='/pub/scm/linux/kernel/git/pcmoore/selinux.git/commit/?id=325e14f97e0c92735d10d9922cbb73ad521de4c4'>Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs</a></td><td><span class='libravatar'><img class='inline' src='//seccdn.libravatar.org/avatar/fb47627bc8c0bcdb36321edfbf02e916?s=13&amp;d=retro' /><img class='onhover' src='//seccdn.libravatar.org/avatar/fb47627bc8c0bcdb36321edfbf02e916?s=128&amp;d=retro' /></span>Linus Torvalds</td><td>4</td><td><span class='deletions'>-21</span>/<span class='insertions'>+34</span></td></tr>"

# expr get the index of the first character appear in $substring
# but not the total $substring
# index=`expr index $line "title"`

commit_date="${line#*title=\'}"
# echo $commit_date
commit_date=${commit_date:0:10}
commit_date=`date -d "$commit_date +1 days" +%Y-%m-%d`
# echo $commit_date
year=${commit_date:0:4}
month=${commit_date:5:2}
day=${commit_date:8:2}
echo $year $month $day

today=`date +%Y-%m-%d`
today_year=${today:0:4}
today_month=${today:5:2}
today_day=${today:8:2}
echo $today_year $today_month $today_day

# only get the commit of yesterday or today
if [ $year -gt $today_year ] || [ $month -gt $today_month ] || [ $day -ge $today_day ]
then
commit_id="${line#*/?id=}"
# echo $commit_id
commit_id=${commit_id:0:40}
echo $commit_id
fi
