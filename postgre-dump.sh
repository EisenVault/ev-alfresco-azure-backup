## Initialize config parameters ##
#. /home/vipulswarup/ev-backup-azure/ev-backup.config
#make backup directory
bak_folder=$BAK_SOURCE_FOLDER/ev_sql_backup
mkdir $bak_folder

#Dump Alfresco DB to SQL File:
$DB_BIN_DIR/pg_dump $DB_NAME -U $DB_USER -h $DB_HOST --no-password > $bak_folder/$DB_NAME-backup.sql 

#zip the backup
pigz --best -f $bak_folder/$DB_NAME-backup.sql
