apt-get update
adduser ghost
usermod -aG sudo ghost
su ghost
apt-get install nginx -y
ufw allow 'Nginx Full'
apt-get install curl -y
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash
apt-get install -y nodejs
apt-get install npm -y
npm install ghost-cli@latest -g
mkdir -p /var/www/ghost
chown ghost:ghost /var/www/ghost
chmod 775 /var/www/ghost
cd /var/www/ghost
ghost install --no-prompt