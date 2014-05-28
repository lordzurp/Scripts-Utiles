#!/bin/bash

# préparation du repertoire backup
mkdir /home/backups
mkdir /home/mysql.backups


# on installe git et on patche cloudfiles

#Version CentOS - pour la prod
/usr/bin/yum install --assumeyes python-setuptools git duplicity

# version Debian - mode Rescue
#apt-get update && apt-get install python-setuptools git duplicity

cd /usr/src
git clone https://github.com/yvangodard/python-cloudfiles-hubic.git
cd python-cloudfiles-hubic
python setup.py  install
rm -Rf /usr/src/python-cloudfiles-hubic


# on récupère les fichiers de conf
# les paramètres spécifiques sont stockés dans d'autres fichiers de config, en fonction du backup (sites, system ou mysql)
wget -O /etc/master-backup.conf --no-check-certificate https://raw.githubusercontent.com/lordzurp/Scripts-Utiles/master/duplicityscripts/etc/master-backup.conf
wget -O /etc/master-backup.system.conf --no-check-certificate https://raw.githubusercontent.com/lordzurp/Scripts-Utiles/master/duplicityscripts/etc/master-backup.system.conf
wget -O /etc/master-backup.sites.conf --no-check-certificate https://raw.githubusercontent.com/lordzurp/Scripts-Utiles/master/duplicityscripts/etc/master-backup.sites.conf
wget -O /etc/master-backup.mysql.conf --no-check-certificate https://raw.githubusercontent.com/lordzurp/Scripts-Utiles/master/duplicityscripts/etc/master-backup.mysql.conf


# On récupère les scripts
wget -O /usr/local/sbin/master-backup-cleanup.sh --no-check-certificate https://raw.github.com/yvangodard/Scripts-Utiles/master/duplicityscripts/scripts/master-backup-cleanup.sh
wget -O /usr/local/sbin/master-backup-listing.sh --no-check-certificate https://raw.github.com/yvangodard/Scripts-Utiles/master/duplicityscripts/scripts/master-backup-listing.sh
wget -O /usr/local/sbin/master-backup-restore.sh --no-check-certificate https://raw.github.com/yvangodard/Scripts-Utiles/master/duplicityscripts/scripts/master-backup-restore.sh
wget -O /usr/local/sbin/master-backup-status.sh --no-check-certificate https://raw.github.com/yvangodard/Scripts-Utiles/master/duplicityscripts/scripts/master-backup-status.sh
wget -O /usr/local/sbin/master-backup-verify.sh --no-check-certificate https://raw.github.com/yvangodard/Scripts-Utiles/master/duplicityscripts/scripts/master-backup-verify.sh
wget -O /usr/local/sbin/master-backup.sh --no-check-certificate https://raw.github.com/yvangodard/Scripts-Utiles/master/duplicityscripts/scripts/master-backup.sh

# et le pti nouveau
wget -O /usr/local/sbin/master-backup.sh --no-check-certificate https://raw.githubusercontent.com/lordzurp/Scripts-Utiles/master/duplicityscripts/scripts/master-backup-all.sh

 
# On les rends exécutables
chmod +x /usr/local/sbin/master-backup*

# backup mysql
wget -O /usr/local/sbin/mysql-backup.sh --no-check-certificate https://raw.githubusercontent.com/lordzurp/Scripts-Utiles/master/mysqlbackup/mysql-backup.sh
chmod +x /usr/local/sbin/mysql-backup.sh

