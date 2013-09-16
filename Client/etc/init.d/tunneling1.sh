#!/bin/bash

# TUNNELID è l'identificativo del tunnel usato per fermarlo e controllarlo, usare massimo 2 cratteri
# onde evitare problemi con killall
TUNNELID=1
COMMAND=tunnel.sh
SSHALIAS=miassh${TUNNELID}
COMMAND_DIR=/sbin/tunneling/

# KEYFILE posizione della chiave privata da utilizzare per l'accesso al server
KEYFILE=/etc/tunneling/keyok.key

# TUNNELOPTIONS opzioni per il port forwarding, si possono mettere più hsots e porte per ulteriori informazioni
# man ssh
TUNNELOPTIONS="-gL1201:192.168.10.1:80"

# LOGINNAME username on server
LOGINNAME=username

# REMOTEHOST server adress
REMOTEHOST=hostname.dnsalias.org

# REMOTEPORT server port
REMOTEPORT=22

# CLIENTID identificativo di questo client, utile per differenziare i log files sul server nel caso 
#in cui accedano diversi client
CLIENTID="MIOPC"

if [ ! -f ${KEYFILE} ]
then
	echo "Non trovo la chiave ${KEYFILE}"
	exit 6
fi

if [ ! -x ${COMMAND_DIR}${COMMAND} ]
then
        echo "Non trovo l'eseguibile ${COMMAND_DIR}${COMMAND}"
        exit 6
fi

case "$1" in
	start)
		if ps -C ${COMMAND}${TUNNELID} > /dev/null 
		then
			echo "Demone gia' attivo"
		else
			echo "Demone attivato"
			ln -s ${COMMAND_DIR}${COMMAND} ${COMMAND_DIR}${COMMAND}${TUNNELID} > /dev/null 2>&1
			nohup ${COMMAND_DIR}${COMMAND}${TUNNELID} ${KEYFILE} ${COMMAND_DIR} ${SSHALIAS} "${TUNNELOPTIONS}" ${LOGINNAME} ${REMOTEHOST} ${TUNNELID} ${CLIENTID} ${REMOTEPORT} > /dev/null 2>&1 &
		fi
	;;
	stop)
		if ps -C ${COMMAND}${TUNNELID} > /dev/null 2>&1
                then
			killall ${COMMAND}${TUNNELID} > /dev/null 2>&1
			killall ${SSHALIAS} > /dev/null 2>&1
		fi
		echo "Demone arrestato"
	;;
	status)
		if ps -C "${COMMAND}${TUNNELID}" > /dev/null 2>&1
		then
			echo "Demone attivo"
		else
			echo "Demone non attivato"
		fi
	;;
	*)
	echo "Usare $0 {start|stop|status}"
	;;
esac

# Copyright Alberto Panu 2005 www.panu.it
# Distribuito sotto licenza GPL http://www.gnu.org/licenses/gpl.txt
