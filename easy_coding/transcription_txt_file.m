close all
clear all
clc

path_txt = './installations/HTS-demo_CMU-ARCTIC-SLT/data/txt/';

txt_files = dir([path_txt '*.txt']);
num_files=length(txt_files);
fid = fopen('txt.done.data','w');

for i=1:num_files
    i
    fname = txt_files(i).name(1:end-4);
    fid_txt = fopen([path_txt txt_files(i).name],'r');
    fline = fgetl(fid_txt);
    fstr = ['( ' fname ' "' fline '"' ' )'];
    fprintf(fid,'%s\n',fstr);
    fclose(fid_txt);
end 

fclose('all')