import csv
import string
import random


header = ['user', 'password']

numUsers = 100
pwdLength = 6

with open('users.csv', 'w', encoding='UTF8') as f:
    writer = csv.writer(f)
    writer.writerow(header)
    for i in range(numUsers):
        pwd_array = random.choices(string.ascii_letters, k=pwdLength)
        pwd = ''
        for j in range(pwdLength):
            pwd = pwd + pwd_array[j]
        data = ['user'+str(i), pwd]
        writer.writerow(data)
