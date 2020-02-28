#ARG BUILD_FROM
#FROM $BUILD_FROM

FROM raspbian/stretch

ENV LANG C.UTF-8

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get update

RUN apt-get install -y libmp3lame0 libtwolame0 alsa-utils

RUN apt-get install -y libjack-jackd2-0 libogg0 libvorbis0a libvorbisenc2

RUN wget https://github.com/x20mar/darkice-with-mp3-for-raspberry-pi/blob/master/darkice_1.0.1-999~mp3+1_armhf.deb?raw=true

RUN mv darkice_1.0.1-999~mp3+1_armhf.deb?raw=true darkice_1.0.1-999~mp3+1_armhf.deb

RUN printf "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN dpkg -i darkice_1.0.1-999~mp3+1_armhf.deb

RUN apt-get install -y icecast2

# Copy data for add-on

COPY darkice4turntable.cfg  /
RUN chmod a+x /darkice4turntable.cfg

COPY icecast.xml /etc/icecast2
RUN chown icecast2 /etc/icecast2/icecast.xml

COPY icecast2 /etc/default
RUN chmod a+x /etc/default/icecast2


EXPOSE 8010

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
