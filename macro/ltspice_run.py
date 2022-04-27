import subprocess
import sys

path_ltspice = r"c:\Program Files\LTC\LTspiceXVII\XVIIx64.exe"

netlist = "../saradc/saradc2.net"

proc = subprocess.run([path_ltspice,"-b",netlist],stdout = subprocess.PIPE, stderr = subprocess.PIPE,shell=True)

print(proc)
