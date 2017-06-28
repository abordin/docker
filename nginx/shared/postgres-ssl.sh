#!/bin/bash

echo hostssl\ all\ all\ 0.0.0.0/0\ md5 >> $PGDATA/pg_hba.conf
cat /etc/postgresql-common/ssl.conf >> $PGDATA/postgresql.conf
sed -i "s/datestyle = 'iso, dmy'/datestyle = 'iso, DMY'/" $PGDATA/postgresql.conf