AWK='mawk'
#DUMPFEATS=$FESTDIR/examples/dumpfeats
TEXT2UTT='/home/computing5/installations/festival/examples/text2utt';
DUMPFEATS='/home/computing5/installations/festival/examples/dumpfeats';
STRTDIR='/home/computing5/TTS/iisc_hindi_male/STRAIGHT';
BSTRTDIR='/home/computing5/TTS/iisc_hindi_male'

#voicedir='/home/spectrumlab/Desktop/installations/TSM/english_iisc_synth';
#tsmdir='/home/spectrumlab/Desktop/installations/TSM/TSM_CODE_V3';
#Generate utterance

echo "Enter Text: "

read input

rm -rf $BSTRTDIR/Gen01.txt
rm -f $STRTDIR/gen/qst001/ver1/2mix/0/*
echo $input >> $BSTRTDIR/Gen01.txt

T=$BSTRTDIR/Gen01.txt;
sed -i 's/^/( Gen01 " /'  $BSTRTDIR/Gen01.txt 
sed -i 's/$/ " )/'  $BSTRTDIR/Gen01.txt 
cd $BSTRTDIR


			if [ -s $T ]; then \
			chmod 777 $BSTRTDIR/Gen01.txt 
				festival -b festvox/build_clunits.scm '(build_prompts "Gen01.txt")'
				
				rm -f $STRTDIR/data/utts/*
				cp prompt-utt/Gen01.utt $STRTDIR/data/utts
				rm -f $STRTDIR/data/scp/gen.scp 
			fi
cd $STRTDIR/data/    
make testlab  			

#$DUMPFEATS -eval scripts/extra_feats.scm -relation Segment -feats scripts/label.feats -output tmp.feats utts; \
#			if [ -s tmp.feats ]; then \
#				$AWK -f scripts/label-full.awk tmp.feats > labels/gen/Gen01.lab; \
#				#$AWK -f scripts/label-mono.awk tmp.feats > labels/mono/Gen01.lab; \
#				#$AWK -f scripts/label-mono.awk tmp.feats > labels/full/Gen01.lab; \	
#				rm -f tmp.feats; \
#			fi; \
#rm -f $STRTDIR/data/scp/gen.scp 
echo $STRTDIR/data/labels/gen/Gen01.lab >> $STRTDIR/data/scp/gen.scp



make testlist
#cat lists/full.list > tmp
#for lab in labels/gen/*.lab; do \
#	sed -e "s/.* //g" $lab >> tmp; \
#done
#sort -u tmp > lists/full_all.list
#rm -f tmp

# Generating a monophone list file
#for lab in labels/mono/$(DATASET)_$(SPEAKER)_*.lab; do \
#	if [ -s $lab -a -s labels/full/`basename $lab` -a -s cmp/`basename $lab .lab`.cmp ]; then \
#		sed -e "s/.* //g" $lab >> tmp; \
#	fi \
#done	
#sort -u tmp > lists/mono.list
#rm -f tmp


#synthesize voice

cd $STRTDIR

make voice
#sleep 75
#play waveform

play $STRTDIR/gen/qst001/ver1/2mix/0/Gen01.wav



