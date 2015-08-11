clf;clear all;
mFile = '2015_Data/Wavelength1/wavelength 1 t00.tif';
Original = imread(mFile);
[Original,BgCorrect] = MyBgCorrect(Original);
subplot(1,2,1)
imshow(Original)
subplot(1,2,2)
imshow(BgCorrect)