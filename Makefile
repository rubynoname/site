deploy:
	bundle exec middleman build
	rsync -r -v build noname@noname01.singlehop.infra.evilmartians.com:/home/noname/site/
