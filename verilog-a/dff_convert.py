

from distutils.ccompiler import new_compiler
from hashlib import new
from types import new_class


path = 'sarlogic.net'

with open(path,'r') as f:
    s = f.read()

lines = s.split('\n')

vdd = 1.8
vss = 0
new_name = 'VerilogA_DFlipFlop'

new_path = 'new_sarlogic.net'

with open(new_path,'w') as f:
    for index,line in enumerate(lines):
        words = line.split()

        if len(words) > 0 and 'A' in words[0]:
            if 'DFLOP' in words:
                name,d,dumm,clk,pre,clr,qb,q,dumm2 = words[:9]
                name = 'XX' + name.split('A')[1]
                new_words = [name,d,clk,q,qb,pre,clr,vdd,vss,"VerilogA_DFlipFlop"]
                words = [str(word) for word in new_words]
                

            elif 'AND' in words:
                name,dumm,A,dumm2,B,dumm3,QB,Q,dumm4 = words[:9]
                name = 'XX' + name.split('A')[1]
                new_words = [name,d,clk,q,qb,pre,clr,vdd,vss,"VerilogA_AND"]
                words = [str(word) for word in new_words]

            elif 'OR' in words:
                name,A,B,C,dumm1,dumm2,QB,Q,dumm3 = words[:9]
                name = 'XX' + name.split('A')[1]
                new_words = [name,A,B,C,Q,QB,"VerilogA_OR"]
                words = [str(word) for word in new_words]

            elif 'BUF' in words:
                name,i,o = words[0],words[1],words[6]
                name = 'XX' + name.split('A')[1]
                new_words = [name,i,o,"VerilogA_inv"]
                words = [str(word) for word in new_words]

        
        line = ' '.join(words)
        f.write(line)
        f.write('\n')







