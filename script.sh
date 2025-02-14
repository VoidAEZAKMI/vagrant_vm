useradd $1 -s /bin/bash -d /home/test
mkdir /home/test
chown -R test:test /home/test
echo ' '$1'      ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers

usermod --password $(openssl passwd -6 $2) root
usermod --password $(openssl passwd -6 $2) $1

if [ $3 == "true" ]; then yum update -y; else echo '$3' =$3; fi

rm -Rf /etc/hosts

echo "127.0.0.1 localhost.localdomain   localhost" >> /etc/hosts
echo "$5    $4.localdomain $4" >> /etc/hosts


echo "***************************"
echo "**** installing git********"
echo "***************************"


yum install -y git


