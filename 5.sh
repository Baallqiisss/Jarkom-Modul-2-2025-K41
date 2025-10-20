# Tirion
eonwe   IN      A       192.168.122.247
earendil IN     A       10.84.1.2
elwing   IN     A       10.84.1.3
cirdan   IN     A       10.84.3.1
elrond   IN     A       10.84.3.2
maglor   IN     A       10.84.3.3
sirion   IN     A       10.84.2.1
lindon   IN     A       10.84.2.2
vingilot IN     A       10.84.2.3

# di earendil ada isinya
nameserver 10.84.2.5
nameserver 10.84.2.7
nameserver 192.168.122.1

# janlup restart tirion
service bind9 restart

# tes
ping elwing.K41.com
