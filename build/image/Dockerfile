#
# Dockerfile
#
#
FROM centos:centos6

COPY web.zip /tmp

RUN \
    yum -y install httpd unzip sudo &&\
    rm -f /etc/httpd/conf.d/welcome.conf &&\
    unzip /tmp/web.zip -d /var/www/html/ &&\
    echo "EnableMMAP off" >> /etc/httpd/conf/httpd.conf &&\ 
    echo "EnableSendfile off" >> /etc/httpd/conf/httpd.conf 

CMD /usr/sbin/httpd -DFOREGROUND
