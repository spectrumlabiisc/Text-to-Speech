close all
clear all
clc

 path_txt = '/home/spectrumlab/TTS/iisc_tts_kannada/prune/wav/';
  write_path_txt = '/home/spectrumlab/TTS/iisc_tts_kannada/prune/wav/';

wav_files = dir([path_txt '*.wav']);
%[wav_files fs] = wavread([path_txt '*.wav']);
num_files = length(wav_files);
fs_new = 16000;
for i=1:num_files
    i
    fname = wav_files(i).name;
    [y, fs, bits] = wavread([path_txt fname]);
    x = resample(y,fs_new,fs);
    
    wavwrite(x,fs_new,bits,[write_path_txt fname]);
end

