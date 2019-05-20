#!/bin/bash

cd ~

wget https://github.com/octobercms/install/archive/master.zip

unzip master.zip

rm master.zip

mv install-master/* /var/www/html

rm -rf install-master
