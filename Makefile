# Makefile for easier and semi-automated operations

new:
	/usr/bin/vagrant/ vagrant up
	/usr/bin/vagrant/ vagrant reload

clean:
	/usr/bin/vagrant/ vagrant destroy -f
	rm -rf .vagrant

fresh: 
	clean 
	new
	sleep 5