deploy:
	bundle exec middleman build
	rsync -r build noname@noname01.singlehop.infra.evilmartians.com:/home/noname/site/
