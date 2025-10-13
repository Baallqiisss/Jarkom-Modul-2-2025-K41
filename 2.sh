# Node Eonwe
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE 10.84.0.0/16

# tes 
ping google.com -c 2
