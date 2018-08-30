all:
	wget --mirror --wait 20 --no-if-modified-since --retry-on-http-error=429 https://www.blockchaintransparency.org/reports/
	wget --mirror --wait 20 --no-if-modified-since --retry-on-http-error=429 https://www.blockchaintransparency.org/exchangerankings/
	git add .
	git commit -m 'Automated commit on '`date +%Y%m%d%H%M%S`

