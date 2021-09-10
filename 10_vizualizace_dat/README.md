# 10. Vizualizace dat

## On-site lekce

### 10.1 Instalace softwaru gnuplot

#### Linux
sudo apt-get install gnuplot

#### MacOS


#### Windows


### 10.2 Jednoduché grafy


```
plot sin(x)
```

```
splot sin(x*y/20)
```

```
plot sin(x) title 'sin(x)', tan(x) title 'tan(x)'
```

```
set title "Počasí" font "Helvetica, 20"
set xlabel "Čas [h]"
set ylabel "Teplota [°C]"
set xrange [0:24]
set yrange [5:30]
set grid
#set autoscale
set key 0.01, 100
#unset key
set arrow from 0, 28 to 13, 28
set label "max T" at 14, 28
#unset label
#set logscale
#set logscale y
#unset logscale
set xtics (0.2, 0.4, 0.6, 0.8)
#unset xticks
set xtics auto
```

### 10.3 Externí data

```
set datafile commentschars "#%?"
plot 'pocasi.dat' using 1:2 title 'teplota' with lines, "pocasi.dat" u 1:3 t 'tlak' w linespoints
```

### 10.4 Multi-plot

```
set multiplot
set size 1, 0.5
set origin 0.0, 0.5; plot sin(x)
set origin 0.0, 0.0; plot cos(x)
unset multiplot
```

### 10.5 Aproximace dat

```
phi(x) = a1*tanh(x/b1)    #aproximacni funkce
a = 0; b = 0.1;   #puvodni nastrel koeficientu
fit phi(x) 'pocasi.dat' using 1:2 via a, b
```

```
plot 'pocasi.dat' u 1:2 t 'pocasi' with points 3 pointtype 7 pointsize 2, a1*tanh(x/b1) t 'aproximace'
```

### 10.6 Tabulkové výpočty

```
plot 'pocasi.dat' u (60*$1):($2 + 273.15)
```

### 10.7 Export grafu do souboru

```
set terminal png size 400, 300 font "Helvetica, 20"
#set terminal pdf
#set term windows   #windows
#set term aqua      #macOS
#set term x11       #linux
set output 'teplota.png'
#set output 'teplota.pdf'
set key top right
set ytics 10
set mytics 4
set mxtics 2
a = 0; b = 0.1
fit phi(x) 'pocasi.dat' u 1:2 via a, b 
plot 'pocasi.dat' u 1:2:(sqrt($2)) t 'teplota' w yerr, phi(x) t 'aproximace'

```

### 10.8 Skripty

```

```

### 10.9 Roura


## Domácí cvičení

### DÚ 10.1 Styly grafů
Gnuplotu je k dispozici velké množství typů grafů. Vyzkoušejte si vytvořit graf s těmito styly na vámi vytvořeném datovém souboru. Poznamenejte si, jaký typ grafu se hodí pro jaká data (pokud netušíte, tak dohledejte).

* lines
* points
* linespoints
* impulses
* dots
* steps
* fsteps
* histeps
* errorbars
* xerrorbars
* yerrorbars
* xyerrorbars
* boxes
* boxerrorbars
* boxxyerrorbars
* financebars
* candlesticks
* vector

### DÚ 10.2 Teplota v procentech
Vykreslete soubor pocasi.dat tak, aby na ose y byly hodnoty teploty v procentech z maximální teploty. Maximální teplota je 30 °C, pak této hodnotě odpovídá 100 %. Minimální teplota je 5 °C, pak této teplotě odpovídá 0 %. Teplota 17.5 °C je přesně v polovině mezi max a min teplotou, pak této hodnotě odpovídá 50 %. Použijte proto operace pro práci s tabulkou.

### DÚ 10.3 

### DÚ 10.4 Automatizovana tvorba GIFu
