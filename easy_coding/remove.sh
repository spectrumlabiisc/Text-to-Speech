# Program to delete the wav files, whose text transcriptions are not there
cat etc/txt.done.data | cut -d ' ' -f2 > check # take the name of the text file eg. "text_001"
ls wav/*.wav > w
sed -e 's/$/.wav/' -i check  # append ".wav" in the end of every line in file CHECK
while read line ;do	
  sed -i "\#$line#d" w
done < check
cat w | cut -d '/' -f2 > w1 
cd wav
xargs rm < ../w1
cd ../
rm w check w1
