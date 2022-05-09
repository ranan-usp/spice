reset

data = "ideal.txt"
data2 = "para.txt"
key1 = "actual"
key2 = "ideal"
key3 = "parasitic"
outfile = "out.pdf"
my_ps = 2
my_xtics = 0.1
my_ylabel = "{/=30 digital output [V]}"
my_y2label = "{/=30 analog input [V]}" 
my_xlabel = "{/=30 analog input [V]}"
# japan_font = "VL PGothic,30" 
japan_font = " Times New Roman,30" 

set colorsequence classic
set size ratio 0

# 余白
set lmargin at screen 0.15
set bmargin at screen 0.12
set rmargin at screen 0.85

# 軸ラベル
set xlabel offset 0,-1
set ylabel offset -5,0

set xlabel my_xlabel
set ylabel my_ylabel

set xlabel font japan_font
set ylabel font japan_font 

set format x '%.1f'
set format y '%.1f'
# set format y2 '%.2f'

# 目盛り
set tics font "Times New Roman, 30"
# set logscale x
set ytics mirror
set ytics my_xtics
# set xtics ('1μ' 1e-6, '2μ' 2e-6, '3μ' 3e-6, '4μ' 4e-6,'5μ' 5e-6, '6μ' 6e-6, '7μ' 7e-6, '8μ' 8e-6,'9μ' 9e-6, '10μ' 10e-6)
# set xtics my_xtics

set xtics offset 0,-0.5

set yrange [0:]

set xzeroaxis
set yzeroaxis

# 凡例
set key opaque box lt 1 lw 1 lc rgb "black"
# set key spacing 4
set key font japan_font
set key width -2
# set key Left
set key height 0.5
set key at graph 0.95,0.25

# グリッド
set grid linetype 1 linecolor 0

# 出力
# set terminal postscript color eps font "Times New Roman, 27"
set term pdfcairo enhanced size 10in, 8in

set output outfile

# plot data using 1:4 with lines lw 2 lc 1 title key2,\
# data using 1:3 with lines lw 2 lc 3 title key1,\
# data2 using 1:3 with lines lw 2 lc 2 title key3

plot data using 1:3 with lines lw 2 lc 1 title key2,\
data using 1:2 with lines lw 2 lc 3 title key1,\
data2 using 1:2 with lines lw 2 lc 7 title key3

# replot 

set terminal win


