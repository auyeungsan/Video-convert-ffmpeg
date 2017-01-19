#!/bin/bash
#
# Description: Checks for existing ffmpeg process and starts one if needed
#
#ps -C ffmpeg

log_time=$(date +"%m-%d-%Y %T")
i=0
for name in desk601hd desk602hd desk603hd desk604hd desk605hd desk606hd desk607hd desk608hd desk609hd desk610hd desk611hd desk612hd desk613hd desk614hd desk615hd desk616hd
        do
        retval=`ps -ef|grep ffmpeg|grep -w $name|awk -F ' ' '{print $2;}'`

        if [ ! -z "$retval" -a "$retval" != " " ]; then
                        echo "$name running"
                        #exit
        else
                        echo "$name not run, rerun now"
                        cd /var/www/html/$name

		        stream_name[$i]=$name
		        i=$(( $i + 1 ))
						
#			/root/bin/ffmpeg -i rtmp://192.168.221.101:443/wogphmain/$name -r 25 -vcodec copy -acodec copy -b:v 600k -x264opts keyint=1000 -s 1024x540 -f hls -hls_init_time 1 -hls_time 1 -use_localtime 1 -hls_list_size 2 -hls_flags delete_segments -hls_segment_filename 'file-%Y%m%d-%s.ts' index.m3u8</dev/null >/dev/null 2>&1 &
			/root/bin/ffmpeg -i rtmp://192.168.221.101:443/wogphmain/$name -r 25 -pix_fmt yuv420p -vcodec libx264 -acodec libfdk_aac -profile:v baseline -b:v 600k -x264opts keyint=25 -s 1024x540 -map 0 -flags -global_header -f hls -hls_init_time 1 -hls_time 1 -use_localtime 1 -hls_list_size 3 -hls_flags delete_segments -hls_segment_filename 'file-%Y%m%d-%s.ts' index.m3u8</dev/null >/dev/null 2>&1 &
                        #exit
        fi
done


if [ ! -z "$stream_name" ];then
	/usr/bin/printf "%b" "***** Streaming warning *****\n\nNotification Type: Warning\nstreaming: ${stream_name[*]}\nState: Stop\n\nDate/Time: $log_time\n" | /bin/mail -r "streaming@lazybugstudio.com (HK date center monitoring)" -S smtp="192.168.202.132:25" -s "** Streaming stop warning **" iame@home.com
fi


#for name in desk601 desk602 desk603 desk604 desk605 desk606 desk607 desk608 desk609 desk610 desk611 desk612 desk613 desk614 desk615 desk616
#        do
#        retval=`ps -ef|grep ffmpeg|grep -w $name|awk -F ' ' '{print $2;}'`

#        if [ ! -z "$retval" -a "$retval" != " " ]; then
#                        kill -9 $retval
			#echo "$name running"
                        #exit
#        else
#                        echo "$name not run, rerun now"
                        #cd /var/www/html/$name
                        #/root/bin/ffmpeg -i rtmp://192.168.221.101:443/wogphmain/$name -r 20 -pix_fmt yuv420p -vcodec libx264 -acodec libfdk_aac -profile:v baseline -b:v 250k -x264opts keyint=25 -s 1024x540 -map 0 -flags -global_header -f hls -hls_init_time 1 -hls_time 1 -use_localtime 1 -hls_list_size 2 -hls_flags delete_segments -hls_segment_filename 'file-%Y%m%d-%s.ts' index.m3u8</dev/null >/dev/null 2>&1 &
                        #exit
#        fi
#done

