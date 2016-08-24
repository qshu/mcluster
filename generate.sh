#make clean ; make mcluster; 
#./mcluster -N 10000 -B 1000 -s 12345 -u 1 -C 5 -o CometsProject



unit=0 # 0 --> Nbody unit;  1 --> astrophysics unit
N=10000
B=100
NAME=N10k_B1k


./mcluster -N $N -B $B -m 0.08 -m 10 -s 12345 -u $unit -C 5 -o $NAME > log.gen


var=`awk '$1=="scalingInfo" {print $4, $7}' log.gen`
echo $var

python output.py $var $NAME
