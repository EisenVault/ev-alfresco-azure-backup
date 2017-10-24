#!/bin/bash

########################################
# EisenVault Backup Script             #
# Author: Vipul Swarup, November 2016  #
# Backups a given Alfresco installation#
# to Microsoft Azure				   #
########################################

BASEDIR=$(dirname "$0")
## Initialize config parameters ##
. $BASEDIR/ev-backup.config
echo "Backing up from $BAK_SOURCE_FOLDER" >>$EV_BAK_LOG_FILE 2>&1

## Shut down alfresco's tomcat ##
#$BAK_SOURCE_FOLDER/tomcat/bin/shutdown.sh >>$EV_BAK_LOG_FILE 2>&1

## Do a Postgresql dump ##
. $BASEDIR/postgre-dump.sh

# Check to see if we're at the first of the month.
# If we are on the 1st day of the month, then run
# a full backup.  If not, then run an incremental
# backup.
date==`date '+%d'`
#echo "Date is $date"
#if [[ $date = 06 ]];
#then
	echo "Running Full backup: duplicity --full-if-older-than $NUM_DAYS_TO_KEEP $BAK_SOURCE_FOLDER azure://$AZURE_CONTAINER" >>$EV_BAK_LOG_FILE 2>&1
	duplicity --full-if-older-than $NUM_DAYS_TO_KEEP $BAK_SOURCE_FOLDER azure://$AZURE_CONTAINER >>$EV_BAK_LOG_FILE 2>&1
#else
#	echo "Running Incremental backup: duplicity $BAK_SOURCE_FOLDER azure://$AZURE_CONTAINER" >>$EV_BAK_LOG_FILE 2>&1
#	duplicity $BAK_SOURCE_FOLDER azure://$AZURE_CONTAINER >>$EV_BAK_LOG_FILE 2>&1
#fi

## Remove backups older than $NUM_DAYS_TO_KEEP Days ##
echo "Running duplicity remove-older-than $NUM_DAYS_TO_KEEP --force azure://$AZURE_CONTAINER" >>$EV_BAK_LOG_FILE 2>&1
duplicity remove-older-than $NUM_DAYS_TO_KEEP --force azure://$AZURE_CONTAINER >>$EV_BAK_LOG_FILE 2>&1

## Start Up alfresco's tomcat ##
#$BAK_SOURCE_FOLDER/tomcat/bin/startup.sh >>$EV_BAK_LOG_FILE 2>&1

# Unset environment variables used by backup script
unset BAK_SOURCE_FOLDER
unset AZURE_CONTAINER
unset AZURE_ACCOUNT_NAME
unset AZURE_ACCOUNT_KEY
unset PASSPHRASE
unset EV_BAK_LOG_FILE
unset PGPASSWORD
