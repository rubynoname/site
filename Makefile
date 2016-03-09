deploy:
	bundle exec middleman build
	rsync -r -v build noname@noname02.do.infra.evilmartians.com:/home/noname/site/
