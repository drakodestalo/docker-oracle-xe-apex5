CREATE DATABASE XE
  USER SYS IDENTIFIED BY manager
  USER SYSTEM IDENTIFIED BY manager
UNDO TABLESPACE UNDOTBS1
  DATAFILE '/u01/app/oracle/oradata/XE/undotbs101.dbf'
  SIZE 200M AUTOEXTEND ON MAXSIZE UNLIMITED;

@?/rdbms/admin/catalog

@?/rdbms/admin/catproc
