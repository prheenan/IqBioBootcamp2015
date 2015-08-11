mBlank = '2015_Data/BlankWells/blank_w1.tif';
mData = '2015_Data/Wavelength1/wavelength 1 t00.tif';
% use of '...' makes it easier to look at the lines!
[BlankImage, DataImage,FlatfieldCorrected,BackgroundAndFlatField] = ...
                 MyBgFlatfield( mBlank,mData);
nPlots = 4;
subplot(1,nPlots,1);
imshow(BlankImage); % show the blank
subplot(1,nPlots,2);
imshow(DataImage); % show the uncorrected data
subplot(1,nPlots,3);
imshow(FlatfieldCorrected); % show the flatfield corrected
subplot(1,nPlots,4);
imshow(BackgroundAndFlatField);
