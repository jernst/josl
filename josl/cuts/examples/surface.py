#!/usr/bin/python
#
# Generate a simple surface file

from math import sin, exp

for y in range(0,40):
    for x in range(-20,20):
        print( 5 * sin(x/3 + y/10) * exp( - y*y/5000 ) + 10, end=' ' )
    print()

