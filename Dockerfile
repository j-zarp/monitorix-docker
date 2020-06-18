FROM debian:buster

RUN apt-get update -y
RUN apt-get install -y monitorix

# Add the launch script
ADD launch.sh /launch.sh
RUN chmod +x /launch.sh

ADD monitorix.conf /etc/monitorix/monitorix.conf

CMD sh /launch.sh

ENV OPTIONS=""
CMD /usr/bin/monitorix -c /etc/monitorix/monitorix.conf -p /run/monitorix.pid $OPTIONS && tail -F /var/log/monitorix
