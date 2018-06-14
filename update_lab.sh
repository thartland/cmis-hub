#!/bin/bash
set -u
echo "Update" "$1"
cd /home/fenics/Installations/labs && git pull
for ((i = 0; i < ${NUMBER_OF_USERS}; i++));
do
cp -rf /home/fenics/Installations/labs/Labs/$1 /home/user${i}/Labs/
chown -R user${i} /home/user${i}/Labs/$1
chmod -R u+rwX /home/user${i}/Labs/$1
done
