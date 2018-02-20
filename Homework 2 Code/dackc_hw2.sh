#!/bin/bash

if [ "$1" == "" ]
then
	echo "Usage: ./dackc_hw2.sh [network] [initial last octet] [ending last octet]"
	echo "example: ./dackc_hw2.sh 192.168.20 1 254"
else
	  #my own interface is wlp2s0 for some reason and not wlan0 like most wireless cards
		tcpdump -w icmpcapture.pcap -i wlp2s0 icmp &
		sleep 5
    for x in $(seq "$2" "$3"); do
    	ping -c 1 "$1"."$x" | grep "64 bytes" | cut -d ' ' -f 4 | sed 's/.$//'
      	if [ "$x" == "$3" ]
        then
          tcpdumppid=$(ps -e | pgrep tcpdump)
          sleep 5
          kill -9 $tcpdumppid
        fi
	  done
fi
