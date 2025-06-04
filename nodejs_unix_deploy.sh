#!/bin/bash

GIT_URL=git@git.com:user/repository.git
REPO_NAME=repository
SOURCE=/home/$REPO_NAME/
DEST=/path_to_project/

cd /home
rm -rf ./$REPO_NAME/
git clone $GIT_URL $REPO_NAME
cd $SOURCE
npm install
rsync -au --exclude-from=.rsync-exclude $SOURCE $DEST