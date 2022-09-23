import csv
import os
import argparse

def push2user(user, folder):
	retval = os.system('cp -rf /home/fenics/cmis_labs/{0} /home/{1}/cmis_labs'.format(folder, user))
	retval = os.system('chown -R {0} /home/{0}/cmis_labs/{1}'.format(user, folder))
	retval = os.system('chmod -R u+rwX /home/{0}/Labs/{1}'.format(user, folder))

parser = argparse.ArgumentParser(description='Push user content')
parser.add_argument('folder', nargs=1)
args = parser.parse_args()
print(args.folder[0])

#os.system('cd /home/fenics/vippde-lab && git pull')
#with open('users.csv') as csvfile:
#	reader = csv.DictReader(csvfile)
#	for row in reader:
#		push2user(row['user'], args.folder[0])
