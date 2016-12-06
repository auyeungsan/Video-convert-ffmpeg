#!/bin/bash
#
# Description: Checks for existing ffmpeg process and starts one if needed
#
#ps -C ffmpeg
retval=`ps -C ffmpeg|grep -v PID`

if [ ! -z "$retval" -a "$retval" != " " ]; then
        echo 'running'
	exit
else
	echo 'not run, rerun now'
	ffmpeg -i rtmp://zip1.sa-vdo.com:443/wogphmain/desk601hd  -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis -b:a 128k -ac 2 -ar 44100 http://localhost:8090/feed.ffm </dev/null >/dev/null 2>/var/log/ffmpeg.log &
	exit
fi

#echo $retval
#retval=`expr $retval`
#echo $retval
#[ ! -z "$retval" -a "$retval" != " " ] && exit
#[  -z "$retval" -a "$retval" = " " ] && nohup ffmpeg -i rtmp://zip1.sa-vdo.com:443/wogphmain/desk601hd  -c:v libvpx -crf 10 -b:v 1M -c:a libvorbis http://localhost:8090/feed.ffm
#exit
