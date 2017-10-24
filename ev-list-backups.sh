BASEDIR=$(dirname "$0")
. $BASEDIR/ev-backup.config
duplicity collection-status azure://$AZURE_CONTAINER
