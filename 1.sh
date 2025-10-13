# Eonwe
echo "nameserver 192.168.122.1" > /etc/resolv.conf

auto eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
    address 10.84.1.1
    netmask 255.255.255.0

auto eth2
iface eth2 inet static
    address 10.84.2.1
    netmask 255.255.255.0

auto eth3
iface eth3 inet static
    address 10.84.3.1
    netmask 255.255.255.0



# earendil
auto eth0
iface eth0 inet static
    address 10.84.1.2
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# elwing
auto eth0
iface eth0 inet static
    address 10.84.1.3
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# cirdan
auto eth0
iface eth0 inet static
    address 10.84.2.2
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# Elrond
auto eth0
iface eth0 inet static
    address 10.84.2.3
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# maglor
auto eth0
iface eth0 inet static
    address 10.84.2.4
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# sirion 
auto eth0
iface eth0 inet static
    address 10.84.3.2
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# tirion
auto eth0
iface eth0 inet static
    address 10.84.3.3
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# valmar
auto eth0
iface eth0 inet static
    address 10.84.3.4
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# vingilot
auto eth0
iface eth0 inet static
    address 10.84.3.6
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf

# lindon
auto eth0
iface eth0 inet static
    address 10.84.3.5
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
