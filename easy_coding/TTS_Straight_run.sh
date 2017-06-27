TEXT2UTT='/home/computing5/installations/festival/examples/text2utt';
DUMPFEATS='/home/computing5/installations/festival/examples/dumpfeats';
STRTDIR='/home/computing5/TTS/iisc_hindi_hts/STRAIGHT';
BSTRTDIR='/home/computing5/TTS/iisc_hindi_hts'


cd $BSTRTDIR


festival -b festvox/build_clunits.scm '(build_prompts "Gen01.txt")'
