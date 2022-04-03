import codecs
import numpy as np
import matplotlib.pyplot as plt 

in_path = "6bit_SAR_test.meas"
out_path = "6bit_SAR_test.mout"

resolution = 6
Vref = 1
Vq = 1/(2**resolution)

start = 200
goal = 12800

write_lines = list()
count = 0
for time in range(start,goal,5):
    count += 1
    time = str(time) + 'n'
    index = str(count)

    line = '.meas tran output_code_' + index + ' find V(DOUT) AT=' + time
    write_lines.append(line)
    line = '.meas tran analog_input_' + index + ' find V(VIN) AT=' + time
    write_lines.append(line)

with open(in_path,'w') as f:
    for line in write_lines:
        f.write(line)
        f.write('\n')

analog_input = list()
output_code = list()
# with codecs.open(out_path, "r", "utf-32", "ignore") as file:
with open(out_path,'r') as f:
    s = f.read()
lines = s.split("\n")
for line in lines:

    words = line.split()

    if not (len(words) > 2):
        continue

    if 'analog_input' in words[0]:
        analog_input.append(float(words[1].split('=')[1]))

    if 'output_code' in words[0]:
        output_code.append(float(words[1].split('=')[1]))

before = output_code[0]
before_v = 0

result = list()
for index,analog_value in enumerate(analog_input):
    if output_code[index] != before:
        result.append(analog_value-before_v)
        before = output_code[index]
        before_v = analog_value

print(result)

ptf = (2**resolution)/Vref
y_ptf = ptf*np.array(analog_input)

# print(output_code)

fig = plt.figure(figsize=(12,10))
plt.plot(analog_input,output_code,label = "actual transform function")
plt.plot(analog_input,y_ptf,label = "perfect transform function")
plt.xlim(0,1)
plt.ylim(0,64)
plt.xlabel('analog input',{"fontsize":18})
plt.ylabel('output code',{"fontsize":18})
plt.legend(prop={"size": 16})
plt.show()

    