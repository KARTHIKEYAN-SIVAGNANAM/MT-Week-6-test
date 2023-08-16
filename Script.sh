#!/bin/bash


sudo apt update
sudo apt install nginx -y

sudo mkdir -p /var/www/html/karthikeyan.mounickraj.com
echo "<html><title>Home Page</title><body><h1>Hello Mentors,karthikeyan.mounickraj.com is hosted on Nginx!</h1><br><a href=\"https://github.com/KARTHIKEYAN-SIVAGNANAM/MT-Week-6-test\">Visit Repository</a></body></html>" | sudo tee /var/www/html/karthikeyan.mounickraj.com/index.html

sudo tee /etc/nginx/sites-available/karthikeyan.mounickraj.com.conf << EOF
server {
    listen 80;
    server_name karthikeyan.mounickraj.com;

    location / {
        root /var/www/html/karthikeyan.mounickraj.com;
        index index.html;
    }
}
EOF

sudo ln -s /etc/nginx/sites-available/karthikeyan.mounickraj.com.conf /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx

sudo apt install certbot python3-certbot-nginx -y

sudo certbot --nginx -d karthikeyan.mounickraj.com -m karthikeyans11092001@gmail.com --agree-tos --eff-email
