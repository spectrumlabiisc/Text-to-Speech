# this is a program to delete all the lines in a file train.scp which has the file names in /home/spectrumlab/TTS/Pavan/iisc_hindi_hts/HTS-demo_CMU-ARCTIC-SLT/gv/qst001/ver1/fal/

ls /home/computing4/iisc_kannada_hts/HTS-demo_CMU-ARCTIC-SLT/gv/qst001/ver1/fal| cut -d'.' -f1>delete
#cut -d'/' -f12 < delete > delete1
sed -e 's/$/.cmp/' -i delete
cp train.scp train1.scp
while read line ;do
  sed -i "\#$line#d" train1.scp
done < delete

cat train1.scp| cut -d'.' -f1>delete1
while read line ;do
  sed -i "\#$line#d" train.scp
done < delete1

rm delete*
