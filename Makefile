# Makefile for easier and semi-automated operations

new:
	vagrant up
	vagrant reload

clean:
	vagrant destroy -f


fresh: clean new
	echo "fresh färtsch"