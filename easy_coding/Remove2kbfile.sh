find splice_wav/ -name "*.wav" -size -2k > delete_list
xargs rm < delete_list
# should try this "cat delete_list | xargs -I{} -d"\n" sed -i '/${}/d'"
while read line ;do
   #sed -i".bak" '/$line/d' map_table 
   #grep -vwE "$line" map_table > m.out
   sed -i "\#$line#d" map_table 
done < delete_list 
