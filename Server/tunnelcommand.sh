#!/bin/bash
date >> tunnelog${1}_${2}.log
while(true);do
 dd if=/dev/random count=1 conv=notrunc
 sleep 30
done

# Copyright Alberto Panu 2005 www.panu.it
# Distribuito sotto licenza GPL http://www.gnu.org/licenses/gpl.txt
