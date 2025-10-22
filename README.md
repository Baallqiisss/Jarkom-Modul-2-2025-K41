# Jarkom-Modul-2-2025-K41

|nama kelompok                | nrp         |
|-----------------------------|-------------|
| Balqis Sani Sabillah        |  5027241002 |   
| Alnico Virendra Kitaro Diaz |  5027241081 |

## Modul 2
Topology Jaringan 

<img width="1250" height="951" alt="Image" src="https://github.com/user-attachments/assets/d3f8056b-c956-4e8d-8265-998b5636aba9" />

## No.1
Di tepi Beleriand yang porak-poranda, Eonwe merentangkan tiga jalur: Barat untuk 
Earendil dan Elwing, Timur untuk Círdan, Elrond, Maglor, serta pelabuhan DMZ bagi 
Sirion, Tirion, Valmar, Lindon, Vingilot. Tetapkan alamat dan default gateway tiap 
tokoh sesuai glosarium yang sudah diberikan.

## Jawaban 

1. Node Eonwe 
```c
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

echo "nameserver 192.168.122.1" > /etc/resolv.conf

```
2. Earendil ( Barat )
```c
auto eth0
iface eth0 inet static
    address 10.84.1.2
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
3. Elwing ( Barat )
```c
auto eth0
iface eth0 inet static
    address 10.84.1.3
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
4. Cirdan ( Timur )
```c
auto eth0
iface eth0 inet static
    address 10.84.3.1
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

5. Elrond ( Timur )
```c
auto eth0
iface eth0 inet static
    address 10.84.2.3
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

6. Maglor ( Timur )
```c
auto eth0
iface eth0 inet static
    address 10.84.2.4
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

7. Sirion 
```c
auto eth0
iface eth0 inet static
    address 10.84.3.2
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

8. Tirion
```c
auto eth0
iface eth0 inet static
    address 10.84.3.3
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

9. Valmar
```c
auto eth0
iface eth0 inet static
    address 10.84.3.4
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

10. Vingilot
```c
auto eth0
iface eth0 inet static
    address 10.84.3.6
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

11. lindon
```c
auto eth0
iface eth0 inet static
    address 10.84.3.5
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
## No 2
Angin dari luar mulai berhembus ketika Eonwe membuka jalan ke awan NAT. Pastikan 
jalur WAN di router aktif dan NAT meneruskan trafik keluar bagi seluruh alamat internal 
sehingga host di dalam dapat mencapai layanan di luar menggunakan IP address. 

Eonwe sebagai router harus bisa menghubungkan semua node internal ke internet.

## Jawaban 
tambahkan iptables di Eonwe

```c
up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.84.0.0/16
```   

lalu tes menggunakan
```c 
ping google.com
```

## No.3
Kabar dari Barat menyapa Timur. Pastikan kelima klien dapat saling berkomunikasi 
lintas jalur (routing internal via Eonwe berfungsi), lalu pastikan setiap host non-router 
menambahkan resolver 192.168.122.1 saat interfacenya aktif agar akses paket dari 
internet tersedia sejak awal. 

## Jawaban 
```c
echo "nameserver 192.168.122.1" > /etc/resolv.conf
```

lalu tes salah satu node dari timur ke barat - barat ke timur

## No.4 
Para penjaga nama naik ke menara, di Tirion (ns1/master) bangun zona <xxxx>.com 
sebagai authoritative dengan SOA yang menunjuk ke ns1.<xxxx>.com dan catatan NS 
untuk ns1.<xxxx>.com dan ns2.<xxxx>.com. Buat A record untuk ns1.<xxxx>.com 
dan ns2.<xxxx>.com yang mengarah ke alamat Tirion dan Valmar sesuai glosarium, 
serta A record apex <xxxx>.com yang mengarah ke alamat Sirion (front door), aktifkan 
notify dan allow-transfer ke Valmar, set forwarders ke 192.168.122.1. Di Valmar 
(ns2/slave) tarik zona <xxxx>.com dari Tirion dan pastikan menjawab authoritative. 
pada seluruh host non-router ubah urutan resolver menjadi IP dari ns1.<xxxx>.com → 
ns2.<xxxx>.com → 192.168.122.1. Verifikasi query ke apex dan hostname layanan 
dalam zona dijawab melalui ns1/ns2. 

## Tirion
```c
apt update
apt install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9
```
### /etc/bind/named.conf.options 
```c
options {
                directory "/var/cache/bind";
                dnssec-validation no;
                forwarders {
                        192.168.122.1;
                };  
                allow-query{any;};
                auth-nxdomain no;
                listen-on-v6 { any; };

```
### /etc/bind/named.conf.local
```c
zone "K41.com" {
    type master:
    also-nootify {10.84.2.7; }; 
    allow-transfer { 10.84.2.7; };
    file "/etc/bind/K41.com"; 
};
```
### /etc/bind/K41.com
```c
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
ns1     IN      A       10.84.2.5 #Tirion
ns2     IN      A       10.84.2.7 #Valmar
@       IN      A       10.84.2.1

```
```c
service bind9 restart
```

## Valmar
```c
apt update
apt install bind9 -y
ln -s /etc/init.d/named /etc/init.d/bind9
```
#### /etc/bind/named.conf.local
```c
zone "K41.com" {
        type slave;
        masters { 10.84.2.5; };
        file "/etc/bind/K41.com";

};
```
### /etc/bind/named.conf.options 
```c
options {
                directory "/var/cache/bind";
                dnssec-validation no;
                forwarders {
                        192.168.122.1;
                };  
                allow-query{any;};
                auth-nxdomain no;
                listen-on-v6 { any; };
```
```c
 service bind9 restart
```

## All Node

### nano /etc/resolv.conf
```
nameserver 10.84.2.5  
nameserver 10.84.2.7  
nameserver 192.168.122.1
``` 

### Tes
```c
ping K41.com
```
## No.6
Lonceng Valmar berdentang mengikuti irama Tirion. Pastikan zone transfer berjalan, Pastikan Valmar (ns2) telah menerima salinan zona terbaru dari Tirion (ns1). Nilai serial SOA di keduanya harus sama

### Jawaban 
## Cek SOA Record di Tirion (ns1)
```c
dig @10.84.2.5 K41.com SOA
```
## Cek SOA Record di Valmar (ns2):
```c
dig @10.84.2.7 K41.com SOA
```

## No.7
Peta kota dan pelabuhan dilukis. Sirion sebagai gerbang, Lindon sebagai web statis, Vingilot sebagai web dinamis. Tambahkan pada zona .com A record untuk sirion..com (IP Sirion), lindon..com (IP Lindon), dan vingilot..com (IP Vingilot). Tetapkan CNAME :

- www..com → sirion..com,  
- static..com → lindon..com, dan   
- app..com → vingilot..com.  

Verifikasi dari dua klien berbeda bahwa seluruh hostname tersebut ter-resolve ke tujuan yang benar dan konsisten.

### Jawaban 
## Tirion 

``` nano nano /etc/bind/K41.com ```
```c
www     IN      CNAME   sirion.k41.com.
static  IN      CNAME   lindon.k41.com.
app     IN      CNAME   vingilot.k41.com.
```
``` service bind9 restart ```

### Tes 
```c
dig www.k41.com CNAME +short 
dig app.k41.com CNAME +short 
dig static.k41.com CNAME +short
```


