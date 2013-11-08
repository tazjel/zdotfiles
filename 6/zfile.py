
#!/usr/bin/env python
# encoding: utf-8
"""

Created by <Your Name> on Nov 08, 2013
"""
import os
essays = [[line.strip() for line in open(os.path.join("/home/ahmed/alltxt/02whole.txt")).readlines() if len(line.strip()) > 1] for essay in range(1, 21)]

def main():
    print essays
if __name__ == '__main__':
    main()
