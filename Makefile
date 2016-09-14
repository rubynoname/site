deploy:
	bundle exec middleman build
	rsync -r -v build rnp:/home/noname/site/
