import sys
import re

for line in sys.stdin:
    if line.strip() == "":
        continue
    else: 
        #remove placeholders in "[]"
        line = re.sub(r'\[\w+\]', '', line)
        #remove underscores
        line = re.sub(r'_', '', line)
        #replace double hyphens with em dash and space
        line = re.sub(r'--', ' — ', line)
        
        line = line.replace(u'\ufeff', '')
        line = " ".join(line.split())
        sys.stdout.write(line + "\n")
