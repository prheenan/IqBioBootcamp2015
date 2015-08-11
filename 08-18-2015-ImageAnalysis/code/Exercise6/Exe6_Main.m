LessThan = 30000;
SetEqualTo = 0;
Image = imread('2015_Data/Wavelength1/wavelength 1 t00.tif');
% get the threshholded version of this image
ThreshImage = MyThresh( Image,LessThan,SetEqualTo );
% plot the two images
subplot(1,2,1);
imshow(Image);
subplot(1,2,2);
imshow(ThreshImage);