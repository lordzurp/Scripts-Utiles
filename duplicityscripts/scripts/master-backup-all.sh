#!/bin/bash

master-backup.sh
master-backup.sh --conf /etc/master-backup.system.conf
master-backup.sh --conf /etc/master-backup.sites.conf
master-backup.sh --conf /etc/master-backup.mysql.conf

