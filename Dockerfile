FROM php:7.2-apache
RUN docker-php-ext-install pdo pdo_mysql &&\
# docker-php-ext-enable pdo_mysql &&\
rm -rf ~/tmp/$var/cache/apk/* &&\
echo "root:.Pbde9dZj" | chpasswd &&\
sed -i -r -e "s/DocumentRoot.*/DocumentRoot \/home\//"  /etc/apache2/sites-available/000-default.conf &&\
sed -i -r -e "s/Order allow,deny.*/Require all granted/g"  /etc/apache2/*.conf &&\
sed -i -r -e "s/Allow from all.*/ /g"  /etc/apache2/*.conf &&\
sed -i -r -e "s/Require all denied.*/Require all granted/g"  /etc/apache2/*.conf &&\
cd &&\
cd .. &&\
cd home &&\
touch index.php &&\
echo "<?php echo phpinfo();?>" > index.php &&\
chown www-data:www-data . &&\
useradd ipssi  &&\
usermod -g www-data ipssi &&\
adduser ipssi www-data
EXPOSE 30000
