#! /usr/bin/env python
from __future__ import print_function
import sys
from collections import Counter

len_dict = {}

line_counter = 0
for line in sys.stdin:
    line_counter += 1
    if line_counter % 10000 == 0:
        print("%d lines processed" % (line_counter), file=sys.stderr)

    source, target = line.split("\t")
    source_tokens = source.split()
    target_tokens = target.split()

    l = max(len(source_tokens), len(target_tokens))
    if l not in len_dict:
        len_dict[l] = 1
    else:
        len_dict[l] += 1

max_len = sorted(len_dict.keys())[-1]

less_or_equal_to_i = 0
for i in xrange(max_len + 1):
    if i in len_dict:
        less_or_equal_to_i += len_dict[i]
        ratio = 100.0 * less_or_equal_to_i / line_counter
        print("both less or equal to %d : %d, %2.2f%%" % (i, less_or_equal_to_i, ratio), file=sys.stdout)
