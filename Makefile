# Makefile for easier and semi-automated operations

new:
	/usr/bin/vagrant up
	/usr/bin/vagrant reload

clean:
	/usr/bin/vagrant destroy -f
	rm -rf .vagrant

fresh: 
	clean 
	new
	sleep 5