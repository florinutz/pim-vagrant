# pim-vagrant
A simple helper for symfony apps and, in particular, PIM

First make sure you have enough RAM for the install. 4G should be enough though.
https://github.com/akeneo/pim-community-standard#create-a-akeneo-pim-project-with-composer

```
vagrant ssh
cd /vagrant
composer create-project --prefer-dist akeneo/pim-community-standard pim "1.3.*@stable"
```

set date.timezone to Europe/Berlin in /etc/php5/cli/php.ini and /etc/php5/fpm/php.ini

import the db (192.168.14.14/localhost(for ssh), pim, pim, pim)
