#!/bin/sh

path=`pwd`
echo $path
mkdir /tmp/srs/
cd /tmp/srs/
sudo apt-get install git
git clone https://git.oschina.net/winlinvip/srs.oschina.git

cd /tmp/srs/srs.oschina/trunk

./configure --rtmp-hls --with-ffmpeg --with-transcode --with-stream-caster \
--with-http-server --with-http-callback --with-http-api --with-stat  --with-dvr --with-nginx --jobs=4

make

cp $path/srs.conf conf/
sudo nohup ./objs/srs -c conf/srs.conf &
