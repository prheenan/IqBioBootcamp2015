mFile = '2015_Data/Wavelength1/wavelength 1 t00.tif';
num = 2;
[ OriginalImage,BlendedImage ] = MyImageBlend( mFile,num );
% display the two images
subplot(1,2,1)
imshow(OriginalImage)
subplot(1,2,2)
imshow(BlendedImage);