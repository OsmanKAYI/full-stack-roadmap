# gnuplot Example

set xdata time # Indicate that x-axis values are time values
set timefmt "%Y-%m-%d %H:%M:%S" # Indicate the pattern the time values will be in
set datafile separator ';' # Set data seperator on file

set xrange ["2022-05-10 13:00:00":"2022-05-10 14:56:00"] # Set x-axis range of values
set yrange [40:120] # Set y-axis range of values

set key left top # Set lengend location to top-left
set xtics rotate by -90 # Rotate dates on x-axis 45deg for cleaner display
set title 'LIGHT Sensors Data' font ",18" # Set graph title, set title font size to 18

# set terminal jpeg size 1200,630 # Set the output format to jpeg, set dimensions to 1200x630

# set output 'output.jpg' # Set output file to output.jpg

set format x "%H/%M" # Set how the dates will be displayed on the plot

set grid # Show grid lines

# plot "lux.dat" using 1:2 notitle with lines # Çizgi grafiği

# plot "lux.dat" using 1:2 notitle with points # Nokta grafiği

plot "lux.dat" using 1:2 notitle w p pt 3 # Farklı nokta görünümü

**Ref:** https://bhoey.com/blog/simple-time-series-graphs-with-gnuplot/
