import csv

header = ['user', 'password']

numUsers = 100
with open('users.csv', 'w', encoding='UTF8') as f:
    writer = csv.writer(f)
    writer.writerow(header)

    for i in range(numUsers):
        data = ['user'+str(i), 'MDS22']
        writer.writerow(data)
