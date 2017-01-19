for name in desk601hd desk602hd desk603hd desk604hd desk605hd desk606hd desk607hd desk608hd desk609hd desk610hd desk611hd desk612hd desk613hd desk614hd desk615hd desk616hd
        do
        retval=`ps -ef|grep ffmpeg|grep -w $name|awk -F ' ' '{print $2;}'`

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

