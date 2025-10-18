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
``` 
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
```
auto eth0
iface eth0 inet static
    address 10.84.1.2
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
3. Elwing ( Barat )
```
auto eth0
iface eth0 inet static
    address 10.84.1.3
    netmask 255.255.255.0
    gateway 10.84.1.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```
4. Cirdan ( Timur )
```
auto eth0
iface eth0 inet static
    address 10.84.3.1
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

5. Elrond ( Timur )
``` auto eth0
iface eth0 inet static
    address 10.84.2.3
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

6. Maglor ( Timur )
```
auto eth0
iface eth0 inet static
    address 10.84.2.4
    netmask 255.255.255.0
    gateway 10.84.2.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

7. Sirion 
```
auto eth0
iface eth0 inet static
    address 10.84.3.2
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

8. Tirion
```
auto eth0
iface eth0 inet static
    address 10.84.3.3
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

9. Valmar
```
auto eth0
iface eth0 inet static
    address 10.84.3.4
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

10. Vingilot
```
auto eth0
iface eth0 inet static
    address 10.84.3.6
    netmask 255.255.255.0
    gateway 10.84.3.1
    up echo nameserver 192.168.122.1 > /etc/resolv.conf
```

11. lindon
```
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

## Jawaban 
tambahkan iptables

``` up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 10.84.0.0/16 ```   

lalu tes menggunakan
``` ping google.com ```

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
