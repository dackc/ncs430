#!/usr/bin/python
import socket
import sys

if len(sys.argv) < 3:
    print("Usage: ./dackc_hw2.py [ip address] [initial port #] [ending port #]")
    print("Example: ./dackc_hw2.py 192.168.1.2 443")

else:
    ip = sys.argv[1]
    initialPort = int(sys.argv[2])
    endingPort = int(sys.argv[3])

    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

    for port in range(initialPort, endingPort + 1):
        if s.connect_ex((ip,port)):
            print("Port ", port, "is closed")
        else:
            print("Port ", port, "is open")

    s.close()
