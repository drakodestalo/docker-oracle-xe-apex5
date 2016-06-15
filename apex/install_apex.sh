#!/bin/bash
chmod a+r /orcl/apex_5.0.3.zip 
chmod a+rwx /assets
sudo -u oracle unzip /orcl/apex_5.0.3.zip -d /assets
/usr/sbin/startup.sh
sudo -u oracle /bin/sh -c 'cd /assets/apex && ORACLE_SID=XE ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe PATH=/usr:/usr/local:/u01/app/oracle/product/11.2.0/xe/bin /u01/app/oracle/product/11.2.0/xe/bin/sqlplus / as sysdba @/apex/install_apex.sql'
sudo -u oracle /bin/sh -c 'cd /assets/apex && ORACLE_SID=XE ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe PATH=/usr:/usr/local:/u01/app/oracle/product/11.2.0/xe/bin /u01/app/oracle/product/11.2.0/xe/bin/sqlplus / as sysdba @/apex/install_apex_epg.sql'
sudo -u oracle /bin/sh -c 'cd /assets/apex && ORACLE_SID=XE ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe PATH=/usr:/usr/local:/u01/app/oracle/product/11.2.0/xe/bin /u01/app/oracle/product/11.2.0/xe/bin/sqlplus / as sysdba @/apex/install_apex_xmldb.sql'
sudo -u oracle /bin/sh -c 'cd /assets/apex && ORACLE_SID=XE ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe PATH=/usr:/usr/local:/u01/app/oracle/product/11.2.0/xe/bin /u01/app/oracle/product/11.2.0/xe/bin/sqlplus / as sysdba @/apex/install_apex_acls.sql'
