for ((i = 0; i < ${NUMBER_OF_USERS}; i++));
do
    cp -r /home/fenics/Installations/labs/Lab* /home/user${i}
    chown -R user${i} /home/user${i}/Lab*
    chmod -R u+rX /home/user${i}/Lab*
done