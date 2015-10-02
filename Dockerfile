FROM debian:jessie
MAINTAINER Christophe Burki, christophe@burkionline.net

# Install system requirements
RUN apt-get update && apt-get install -y \
    locales \
    wget
RUN echo "deb http://apt.insynchq.com/ubuntu trusty non-free contrib" > /etc/apt/sources.list.d/insync.list
RUN wget -O - https://d2t3ff60b2tol4.cloudfront.net/services@insynchq.com.gpg.key | apt-key add -
RUN apt-get update && apt-get install -y \
    insync-headless

# Configure locales and timezone
RUN locale-gen en_GB.UTF-8
RUN locale-gen fr_CH.UTF-8
RUN locale-gen en_US.UTF-8
RUN cp /usr/share/zoneinfo/Europe/Zurich /etc/localtime
RUN echo "Europe/Zurich" > /etc/timezone

# s6 install and config
COPY bin/* /usr/bin/
COPY configs/etc/s6 /etc/s6/

# install scripts
COPY scripts/* /usr/local/bin/

CMD ["/usr/bin/s6-svscan", "/etc/s6"]
