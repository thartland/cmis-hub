#!/bin/bash

echo "Update Lab materials from GitHub"
cd /home/fenics/Installations/labs && git pull

echo "Creating ${NUMBER_OF_USERS} new users..."
for ((i = 0; i < ${NUMBER_OF_USERS}; i++));
do
    password="Breckenridge${i}_g2s3"
    useradd "user${i}" -m -s /bin/bash
    echo "user${i}:${password}" | chpasswd user${i}
    
    cp -rf /home/fenics/.jupyter /home/user${i}/.jupyter
    chown -R user${i} /home/user${i}/.jupyter
    chmod -R u+rX /home/user${i}/.jupyter
    
    cp -r /home/fenics/Installations/labs/Labs /home/user${i}/
    chown -R user${i} /home/user${i}/Labs
    chmod -R u+rX /home/user${i}/Labs
 
    echo "Created user${i} with password ${password}"
done
