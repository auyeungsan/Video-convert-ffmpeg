for name in desk601 desk602 desk603 desk604 desk605 desk606 desk607 desk608 desk609 desk610 desk611 desk612 desk613 desk614 desk615 desk616
        do
        retval=`ps -ef|grep ffmpeg|grep -w ${name}hd|awk -F ' ' '{print $2;}'`

        if [ ! -z "$retval" -a "$retval" != " " ]; then
                        kill -9 $retval
                        echo "$name killed"
                        #exit
        else
                        echo "$name not run"
                        #cd /var/www/html/$name
                        #/root/bin/ffmpeg -i rtmp://192.168.221.101:443/wogphmain/$name -r 20 -pix_fmt yuv420p -vcodec libx264 -acodec libfdk_aac -profile:v baseline -b:v 250k -x264opts keyint=25 -s 1024x540 -map 0 -flags -global_header -f hls -hls_init_time 1 -hls_time 1 -use_localtime 1 -hls_list_size 2 -hls_flags delete_segments -hls_segment_filename 'file-%Y%m%d-%s.ts' index.m3u8</dev/null >/dev/null 2>&1 &
                        #exit
        fi
done

