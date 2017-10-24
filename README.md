# ev-alfresco-azure-backup
Simple scripts using Duplicity on Linux to backup Alfresco Content and DB to Azure Blob Storage
Provided by EisenVault (https://eisenvault.com)
Please write to us at: contact@eisenvault.com, with any questions or feedback.

# How to Use this?
We assume you are using Ubuntu 16.04 Server Edition (not tested with other versions of Linux).
* Step 1 - as root/sudo, run "install-dependencies.sh". This installs duplicity and azure related dependencies.
* Step 2 - create a storage container in Azure
* Step 3 - update the ev-backup.config file with correct details as per your instance of Alfresco and Azure.
* Step 4 - Run ev-backup.sh to run the backup

You can put a line in your Cron file to run this regularly.

* ev-restore.sh is for restoring backups
* ev-list-backups.sh is for listing available backups
* postgre-dump.sh is called from the ev-backup.sh script, to take a dump of the database.
