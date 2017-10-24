apt install python-pip python-dev libffi-dev libssl-dev libxml2-dev libxslt1-dev libjpeg8-dev zlib1g-dev
# Install dependencies
add-apt-repository ppa:duplicity-team/ppa
apt-get update -y
apt-get install duplicity pigz -y
apt-get install python-pip -y
pip install azure==1.0.3 azure-common==1.1.4 azure-mgmt==0.20.2 azure-mgmt-common==0.20.0 azure-mgmt-compute==0.20.1 azure-mgmt-network==0.20.1 azure-mgmt-nspkg==1.0.0 azure-mgmt-resource==0.20.1 azure-mgmt-storage==0.20.0 azure-nspkg==1.0.0 azure-servicebus==0.20.1 azure-servicemanagement-legacy==0.20.2 azure-storage==0.20.3 
