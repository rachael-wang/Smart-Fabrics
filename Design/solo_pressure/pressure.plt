#!/usr/bin/gnuplot
load "../style.gnu"

set grid
set output "pressure.eps"
set datafile separator ","

set key at graph 0.99,0.98
set key box
set key samplen 2
set key reverse
set key Left
set key font "Helvetica,24"
set size 0.8,0.7

set xrange [0:40]
set xtics 10
set yrange [-0.3:0.4]
set ytics 0.2

set xlabel "Time(sec)" offset 0,0.2
set ylabel "R Change Ratio" offset 1,0

plot "test_day_pressure_mid_per.csv" using 1:2 title "Middle" w l ls 10, \
"test_day_pressure_left_per.csv" using 1:2 title "Left" w l ls 11, \
"test_day_pressure_right_per.csv" using 1:2 title "Right" w l ls 12

   