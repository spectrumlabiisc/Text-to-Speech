# to convert wav files to 16k hz
# change the pwd to the folder containing wav files aand run
for f in $(ls -1 *.wav);do sox -S $f $f rate 16000  ; done;

# to get text.done.data from sentence level transcription
for f in *.txt; do echo '(' ${f%.*};done >txt.done
cat *.txt > txt.done1
sed 's/^/"/' txt.done1 > txt.done2
paste txt.done txt.done2 > txtfiler
sed 's/$/")/' txtfiler > new



