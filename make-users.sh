#!/bin/bash
echo "Creating ${NUMBER_OF_USERS} new users..."
for ((i = 0; i < ${NUMBER_OF_USERS}; i++));
do
    password=$(pwgen -N 1)
    useradd "user${i}" -m -s /bin/bash
    echo "user${i}:${password}" | chpasswd user${i}
    cp -r /home/fenics/hippylib /home/user${i}/hippylib
    chown -R user${i} /home/user${i}/hippylib
    chmod -R u+rX /home/user${i}/hippylib
    #cp -r /home/fenics/hippylib-tutorial /home/user${i}/hippylib-tutorial
    #chown -R user${i} /home/user${i}/hippylib-tutorial
    #chmod -R u+rX /home/user${i}/hippylib-tutorial
    cp -rf /home/fenics/.jupyter /home/user${i}/.jupyter
    chown -R user${i} /home/user${i}/.jupyter
    chmod -R u+rX /home/user${i}/.jupyter
 
    echo "Created user${i} with password ${password}"
done
