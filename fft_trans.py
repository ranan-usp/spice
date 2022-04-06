from importlib.machinery import WindowsRegistryFinder
import re
from tkinter import W

path = 'saradc.txt'


with open(path, encoding="utf8", errors='ignore') as f:
    s = f.read()
lines = s.split('\n')

path = 'saradc2.txt'

with open(path,'w') as f:
    for line in lines:
        words = re.split('[ \t,dB()]',line)
        words = [w for w in words if w != '']
        if len(words) == 3 and words[0] != 'Freq.':
            text = str(float(words[0])) + ' ' + str(float(words[1])) + '\n'
            f.write(text)
    
    