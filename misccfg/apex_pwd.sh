#!/bin/bash
chmod a+rwx /misccfg
/usr/sbin/startup.sh
sudo -u oracle /bin/sh -c 'cd /assets/apex && ORACLE_SID=XE ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe PATH=/usr:/usr/local:/u01/app/oracle/product/11.2.0/xe/bin /u01/app/oracle/product/11.2.0/xe/bin/sqlplus / as sysdba @/misccfg/apxpwd.sql'
