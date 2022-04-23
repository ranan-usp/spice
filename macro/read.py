

import numpy as np
import re
import pprint
import matplotlib.pyplot as plt

def read_adc_log(path):

    analog_in = list()
    digital_out = list()
    with open(path, encoding="utf8", errors='ignore') as f:
        s = f.read()
    lines = s.split('\n')
    for line in lines:
        if 'analog_input' in line:
            words = re.split('[ =:]',line)
            analog_in.append(float(words[3]))
        if 'output_code' in line:
            words = re.split('[ =:]',line)
            digital_out.append(float(words[3]))
    
    return analog_in,digital_out

def plot_adc(analog_in,digital_out):
    resolution = 6
    Vref = 1
    ptf = (2**resolution)/Vref
    y_ptf = ptf*np.array(analog_in)

    with open('trans_memo.txt','w') as f:
        for index in range(len(analog_in)):
            insert_text = str(analog_in[index]) + ' ' + str(digital_out[index]) + ' ' + str(y_ptf[index]/64)
            f.write(insert_text)
            f.write('\n')


if __name__ == '__main__':

    path = '../saradc/saradc.log'
    analog_in,digital_out = read_adc_log(path)

    plot_adc(analog_in,digital_out)
