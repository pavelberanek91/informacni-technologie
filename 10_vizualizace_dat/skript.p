if (vystup eq "png"){
    set terminal png
    set output "data.png"
    set title "png"
} else {
    set title "x11"
    set terminal x11
}
set key top left
set xlabel "t [h]"
set yrange[0:35]
set ylabel "T [°C]"
set y2range[-5:5]
set y2label "odchylka"
set ytics 10
set y2tics 2
set mytics 4
set mxtics 2
set xtics nomirror
a = 0; b = 0; c = 0
phi(x) = a*x**2 + b*x + c
fit phi(x) 'pocasi.dat' u 1:2 via a, b, c 
plot 'pocasi.dat' u 1:2:(sqrt($2)) t 'T [°C]' w yerr axis x1y1, phi(x) t 'aproximace' axis x1y1, 'pocasi.dat' u 1:($2*9/5 + 32) t 'T [°F]' axis x1y2
