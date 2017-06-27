#!/bin/sh
# this program calculates the total duration of all the files in a given folder.To run this code, have the base folder as the folders containing all the wav files, in terminal. Then type, $ sh cal_length.sh
#length = 0;
for f in $(ls -1 *.wav);do 
len=$(soxi -D $f);
#length=$(echo $length + $len | bc);  
#length+=$len;
echo $len 
done > a.txt
echo "total = 0

with open('a.txt', 'r') as inp:
   for line in inp:
       try:
           num = float(line)
           total += num
           
       except ValueError:
           print('{} is not a number!'.format(line))
total=total/60
print('Total length of all wave files: {}'.format(total/60))" > tot_len.py

python tot_len.py

rm a.txt tot_len.py


