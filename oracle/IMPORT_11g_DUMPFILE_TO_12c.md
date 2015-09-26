#Importing Oracle 11g dump file —> Oracle 12c enterprise

## Example scenario:
We are trying to import an Oracle 11g dump file to another environment which runs Oracle 12c Enterprise edition.
Furthermore, the dump file contains:
- DB name = TRUE_KMS, size of over 10 GB
- DB username = KMS_LH_OWN


## Step-by-step instructions

- Create directory `TRUE_KMS` as ‘/path/‘;
- Create tablespace `KMS_LH_DATA_TBS` datafile ‘/path/data.tbs’ size 10G auto extend on;
- Copy dump file to `TRUE_KMS` path
- `alter session set "_ORACLE_SCRIPT"=true;`
- `create user KMS_LH_OWN identified by true DEFAULT TABLESPACE "KMS_LH_DATA_TBS" TEMPORARY TABLESPACE “TEMP"`
- `grant create table to KMS_LH_OWN`
- `grant read on directory TRUE_KMS to KMS_LH_OWN`
- `grant unlimited tablespace to KMS_LH_OWN`
- Make the database characterset UTF-8
	- `shutdown immediate`
	- `start restrict`
	- `ALTER DATABASE NATIONAL CHARACTER SET INTERNAL_USE utf8 ;`
- Check the system characterset
	- `select parameter,value from nls_database_parameters where parameter like '%CHARACTERSET’;`
	- `locale -a`
	- Edit:` /etc/sysconfig/i18n`, set the UTF-8 locale
- Start importing the data from the dump file:
 	- `host impdp KMS_LH_OWN/true directory=TRUE_KMS dumpfile=kms.dump content=data_only logfile=import_data.log EXCLUDE=REF_CONSTRAINT tables=group_tab,tb2,tb3,..`
 	- Repeat until all tables are transferred.