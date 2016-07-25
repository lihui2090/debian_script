#!/bin/bash

drop_cache(){
while true 
do
echo "drop cache"
echo 1 > /proc/sys/vm/drop_caches 
sleep 60
done

}


drop_cache
