#! /usr/bin/env python
from __future__ import print_function
import sys
from collections import Counter

c = Counter()

line_counter = 0
for line in sys.stdin:
    line_counter += 1
    if line_counter % 10000 == 0:
        print("%d lines processed" % (line_counter), file=sys.stderr)
    for word in line.split():
        c[word] += 1

for key,f in sorted(c.items(), key=lambda x: x[1], reverse=True):
    print(key+" "+ str(f))
