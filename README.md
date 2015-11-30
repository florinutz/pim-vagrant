# pim-vagrant
A simple helper for symfony apps and, in particular, PIM

First make sure you have enough RAM for the install. 4G should be ridiculously enough, and you can reduce it after the composer install from Vagrantfile if needed.
https://github.com/akeneo/pim-community-standard#create-a-akeneo-pim-project-with-composer

```
vagrant ssh
cd /vagrant
composer create-project --prefer-dist akeneo/pim-community-standard pim "1.3.*@stable"
```

* enable mcrypt http://askubuntu.com/questions/460837/mcrypt-extension-is-missing-in-14-04-server-for-mysql (but for fpm, not apache)
* set date.timezone to Europe/Berlin in /etc/php5/cli/php.ini and /etc/php5/fpm/php.ini

```
cd /vagrant/pim
php app/console cache:clear --env=prod
php app/console pim:install --env=prod
```

overwrite the db (192.168.14.14/localhost(for ssh), pim, pim, pim) with your dump

clone the automp repo somewhere in vagrant and 
```
cp -rf automp/tools/pim/* /vagrant/pim/
php app/console cache:clear --env=prod
```
