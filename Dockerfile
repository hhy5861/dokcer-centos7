# Cent OS 7.1503

FROM scratch
MAINTAINER Mike Huang <hhy5861@gmail.com>

ADD centos-7.1503-20150330_1749-docker.tar.xz / 
ADD Centos-7.repo /etc/yum.repos.d/
ADD epel-7.repo /etc/yum.repos.d/

RUN yum -y install python-setuptools && \
    easy_install pip && \
    pip install supervisor && \
    echo_supervisord_conf > supervisord.conf && \
    cp supervisord.conf /etc/supervisord.conf && \
    mkdir /etc/supervisord.d && \
    echo '[include]' >> /etc/supervisord.conf && \
    echo 'files = /etc/supervisord.d/*.conf' >> /etc/supervisord.conf
	
#ADD supervisord.sh /etc/rc.d/init.d/supervisord   
#RUN chmod +x /etc/rc.d/init.d/supervisord &&\
#    chkconfig --add supervisord && \
#    chkconfig supervisord on && \

CMD ["/bin/bash"]
