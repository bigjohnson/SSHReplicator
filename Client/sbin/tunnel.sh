#!/bin/bash
while(true);do
	
	date >> /var/log/tunneling${7}.log
	ln -s `which ssh` ${2}${3} > /dev/null 2>&1 
	${2}${3} -ni ${1} ${4} -p ${9} -l ${5} ${6} ./tunnelcommand.sh ${7} ${8}> /dev/null 2>&1
	sleep 30
done

# Copyright Alberto Panu 2005 www.panu.it
# Distribuito sotto licenza GPL http://www.gnu.org/licenses/gpl.txt
