path(path,'/home/spectrumlab/Desktop/installations/STRAIGHTtrial/STRAIGHTV40pcode');
prm.spectralUpdateInterval = 5.000000;
prm.levelNormalizationIndicator = 0;

fprintf(1,'\nSynthesizing /home/spectrumlab/Desktop/installations/EnglishHTSsystems/female/GV_MGC35_BAP25/HTS-demo_CMU-ARCTIC-SLT/gen/qst001/ver1/1mix/0/Gen01.wav\n');
fid1 = fopen('/home/spectrumlab/Desktop/installations/EnglishHTSsystems/female/GV_MGC35_BAP25/HTS-demo_CMU-ARCTIC-SLT/gen/qst001/ver1/1mix/0/Gen01.sp','r','ieee-le');
fid2 = fopen('/home/spectrumlab/Desktop/installations/EnglishHTSsystems/female/GV_MGC35_BAP25/HTS-demo_CMU-ARCTIC-SLT/gen/qst001/ver1/1mix/0/Gen01.ap','r','ieee-le');
fid3 = fopen('/home/spectrumlab/Desktop/installations/EnglishHTSsystems/female/GV_MGC35_BAP25/HTS-demo_CMU-ARCTIC-SLT/gen/qst001/ver1/1mix/0/Gen01.f0','r','ieee-le');
sp = fread(fid1,[1025, 271],'float');
ap = fread(fid2,[1025, 271],'float');
f0 = fread(fid3,[1, 271],'float');
fclose(fid1);
fclose(fid2);
fclose(fid3);
sp = sp*(1.42045454545455e-05);
[sy] = exstraightsynth(f0,sp,ap,48000,prm);
wavwrite( sy, 48000, '/home/spectrumlab/Desktop/installations/EnglishHTSsystems/female/GV_MGC35_BAP25/HTS-demo_CMU-ARCTIC-SLT/gen/qst001/ver1/1mix/0/Gen01.wav');

quit;
