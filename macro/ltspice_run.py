import subprocess


path_ltspice = r"c:\Program Files\LTC\LTspiceXVII\XVIIx64.exe"

netlist = "../saradc/tb_saradc.net"

proc = subprocess.run([path_ltspice,"-b",netlist],stdout = subprocess.PIPE, stderr = subprocess.PIPE,shell=True)

print(proc)
