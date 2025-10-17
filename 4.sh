# Langkah - Langkah nya
# 1.  apt-get update
# 2.  apt-get install bind9 -y
# 3. ln -s /etc/init.d/named /etc/init.d/bind9

# Tirion 

# /etc/bind/named.conf.options 
options {
                directory "/var/cache/bind";
                dnssec-validation no;
                forwarders {
                        192.168.122.1;
                };  
                allow-query{any;};
                auth-nxdomain no;
                listen-on-v6 { any; };

};

# /etc/bind/named.conf.local
zone "K41.com" {
    type master:
    also-nootify {10.84.2.7; }; 
    allow-transfer { 10.84.2.7; };
    file "/etc/bind/K41.com"; 
};

# /etc/bind/K41.com
TTL    604800          ; Waktu cache default (detik)
@       IN      SOA     K41.com. root.K41.com. (
                        2025100401 ; Serial (format YYYYMMDDXX)
                        604800     ; Refresh (1 minggu)
                        86400      ; Retry (1 hari)
                        2419200    ; Expire (4 minggu)
                        604800 )   ; Negative Cache TTL
;

@       IN      NS      ns1.K41.com.
@       IN      NS      ns2.K41.com.
ns1     IN      A       10.84.2.7
ns2     IN      A       10.84.2.5
@       IN      A       10.84.2.1

#Valmar
# /etc/bind/named.conf.local

zone "K41.com" {
        type slave;
        masters { 10.84.2.5; };
        file "/etc/bind/K41.com";

};

# Tes
ping < salah satu node terserah yg penting client > 

# Contoh Earendil
ping 10.15.43.32 5675

nano /etc/resolv.conf

nameserver 10.84.2.5
nameserver 10.84.2.7
nameserver 192.168.122.1

# 4. service bind9 restart 