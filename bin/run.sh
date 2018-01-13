#!/bin/bash - 

. /app/lib/common.sh

CHECK_BIN "git"
CHECK_BIN "uwsgi"

DIR=/var/www/PodcastGenerator-master

if [[ ! -d $DIR ]]; then
	MSG "Cloning podcastgen..."
	git clone https://github.com/albertobeta/PodcastGenerator $DIR
	ls -la /var/www
	[[ -d $DIR ]] || { ERR "Directory $DIR does not exist, aborting."; exit 1; }
	chown -R www-data:www-data /var/www/
fi

MSG "Serving site..."

exec "$@"
