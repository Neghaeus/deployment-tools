#!/bin/bash

GIT_URL=git@git.com:user/repository.git
REPO_NAME=repository
SOURCE=/home/$REPO_NAME/
DEST=/path_to_project/
CONFIG_DIR=/opt/$REPO_NAME

cd /home
rm -rf ./$REPO_NAME/
git clone $GIT_URL $REPO_NAME
cd $SOURCE
composer -n install
chown -R www-data:www-data $SOURCE
find $SOURCE -type d -exec chmod 750 {} +
find $SOURCE -type f -exec chmod 640 {} +
chown -R www-data:www-data $CONFIG_DIR
chmod 750 $CONFIG_DIR
rsync -au --exclude-from=.rsync-exclude $SOURCE $DEST