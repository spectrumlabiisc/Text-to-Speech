#Text-to-Speech synthesis


AWK='mawk'
DUMPFEATS=$FESTDIR/examples/dumpfeats
TEXT2UTT='/home/spectrumlab/Desktop/installations/festival/examples/text2utt';
DUMPFEATS='/home/spectrumlab/Desktop/installations/festival/examples/dumpfeats';
HTSdir='/home/spectrumlab/Desktop/installations/EnglishHTSsystems/female/GV_MGC35_BAP25/HTS-demo_CMU-ARCTIC-SLT';
voicedir='/home/spectrumlab/Desktop/installations/TSM/english_iisc_synth';
tsmdir='/home/spectrumlab/Desktop/installations/TSM/TSM_CODE_V3';
#Generate utterance

echo "Enter Text: "

read input

rm -rf $HTSdir/data/txt/Gen01.txt
echo $input >> $HTSdir/data/txt/Gen01.txt
T=$HTSdir/data/txt/Gen01.txt;

			if [ -s $T ]; then \
				perl $HTSdir/data/scripts/normtext.pl $T > tmp.txt; \
				$TEXT2UTT tmp.txt > tmp.utt; \
				$DUMPFEATS -eval $HTSdir/data/scripts/extra_feats.scm -relation Segment -feats $HTSdir/data/scripts/label.feats -output tmp.feats tmp.utt; \
				rm -f tmp.txt tmp.utt; \
			fi; \
			if [ -s tmp.feats ]; then \
				$AWK -f $HTSdir/data/scripts/label-full.awk tmp.feats >  $HTSdir/data/labels/gen/Gen01.lab; \
				#rm -f tmp.feats; \
			fi; \
#make generation scripts

rm -f $HTSdir/data/scp/gen.scp 

echo $HTSdir/data/labels/gen/Gen01.lab >> $HTSdir/data/scp/gen.scp
cd $HTSdir/data

make list
#synthesize voice

cd $HTSdir

make voice

#play waveform

play $HTSdir/gen/qst001/ver1/1mix/0/Gen01.wav

#make mod 
#cp $HTSdir/gen/qst001/ver1/hts_engine/Gen01.wav $tsmdir/;
#cd $tsmdir
#./TSM
