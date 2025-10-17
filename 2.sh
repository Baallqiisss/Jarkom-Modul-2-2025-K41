# Node Eonwe
up echo "nameserver 192.168.122.1" > /etc/resolv.conf
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.84.0.0/16

# tes 
ping google.com
