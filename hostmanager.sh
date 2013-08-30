#!/bin/bash
# Requires two env variables ACETRAVELS_DOMAIN and ACETRAVELS_MINION to be set in /env/environment
# Hostname is set only if the above variables are set and has not been set already

HOSTNAME_RESOLVER_URI="http://config-server.cloud.acetravels.com:3000"
CURRENT=`hostname`
DOMAIN=`echo $ACETRAVELS_DOMAIN`
MINION=`echo $ACETRAVELS_MINION`
if [ "$MINION" == "true" ]; then
        if [ -n "$DOMAIN" ]; then
                echo $CURRENT
                case $CURRENT in
                    *"acetravels"* ) echo "Hostname has already been set.";;
                    * ) echo "Setting a new hostname..."
                        HOSTNAME1=`curl $HOSTNAME_RESOLVER_URI/getHostname?domain=$DOMAIN`
                        `echo "$HOSTNAME1">/etc/hostname`
                        `sed -i "s/127.0.0.1/127.0.0.1 $HOSTNAME1 /g" /etc/hosts`
                        `hostname -b -F /etc/hostname`
			cd /etc/rsyslog.d
			mv graylog2.conf.bak graylog2.conf
			service rsyslog restart
                        echo "Done";;
                esac
        else
                echo ""
                echo "Please set the required environment variable ACETRAVELS_DOMAIN"
                echo "Eg. export ACETRAVELS_DOMAIN='logs.cloud.acetravels.com'"
                echo ""
        fi
else
        echo "Exiting. Not a minion" 
fi
