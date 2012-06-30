apt-get -y install git-core python-virtualenv #  python-software-properties
# add-apt-repository ppa:saltstack/salt
# apt-get update
apt-get install -y salt-minion # salt-master

service salt-master stop
pkill salt-master
for x in {master,minion}; do
    rm /etc/salt/$x
    cp /tmp/salt-config/$x /etc/salt
    service salt-$x restart || service salt-$x start
done
sleep 10
salt-key -a master
