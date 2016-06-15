FROM ubuntu:14.04.4
RUN apt-get update && apt-get install -y bash openssh-server libaio1 net-tools bc unzip

ADD orcl /orcl
ADD assets /assets
RUN /assets/setup.sh

# Installs Oracle Apex 5.0.3
ADD apex /apex
RUN /apex/install_apex.sh

ADD misccfg /misccfg
RUN /misccfg/apex_pwd.sh

# Remove installation files
RUN rm -r /assets/ /apex/ /orcl/ /misccfg/
EXPOSE 22
EXPOSE 1521
EXPOSE 8080

CMD /usr/sbin/startup.sh && /usr/sbin/sshd -D
VOLUME /u01
