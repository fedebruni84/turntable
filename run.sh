#!/bin/bash

echo "Provaaaaaaaaaaaaaaaaaa"

#wget https://github.com/x20mar/darkice-with-mp3-for-raspberry-pi/blob/master/darkice_1.0.1-999~mp3+1_armhf.deb?raw=true

#mv darkice_1.0.1-999~mp3+1_armhf.deb?raw=true darkice_1.0.1-999~mp3+1_armhf.deb

arecord -l

#ls -la /etc/icecast2/

/etc/init.d/icecast2 start

darkice -c /darkice4turntable.cfg

#sudo dpkg -i darkice_1.0.1-999~mp3+1_armhf.deb
