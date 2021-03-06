PATH:=$(PATH):/usr/local/bin:/usr/bin:/bin

all: crontab
	wget --mirror --wait 20 --no-if-modified-since --retry-on-http-error=429 https://www.blockchaintransparency.org/reports/
	wget --mirror --wait 20 --no-if-modified-since --retry-on-http-error=429 https://www.blockchaintransparency.org/exchangerankings/
	for url in `grep -r "img src" www.blockchaintransparency.org | cut -d'"' -f2` ; do wget --mirror $$url ; done
	git add .
	git commit -m 'Automated commit on '`date +%Y%m%d%H%M%S`

crontab:
	@if ! crontab -l | grep "/usr/bin/make -C `pwd`" ; then \
	  ( crontab -l ; echo "0 12 * * *	/usr/bin/make -C `pwd`" ) | crontab - ; \
	fi

