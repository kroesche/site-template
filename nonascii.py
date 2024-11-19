#!/usr/bin/env python3

# prints lines in file that contain non-ascii characters
#
# I had a hard time finding a way to do this using grep in a portable way that
# worked on mac and linux that didn't require installing other tools or doing
# run-time checks.

import sys

filename = sys.argv[1]

print(f"\n{filename}:")
with open(filename, "rt", encoding="utf-8") as f:
    for line in f:
        if not line.isascii():
            print(line)
