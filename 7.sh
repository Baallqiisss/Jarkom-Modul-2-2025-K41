# Node Tirion

# nano /etc/bind/k41.com

```

www     IN      CNAME   sirion.k41.com.
static  IN      CNAME   lindon.k41.com.
app     IN      CNAME   vingilot.k41.com.

```
# service bind9 restart

# Tes 
` dig www.k41.com CNAME +short `
` dig app.k41.com CNAME +short '
` dig static.k41.com CNAME +short '
