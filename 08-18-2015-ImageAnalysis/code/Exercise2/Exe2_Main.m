%Load the same image as in the previous file in your main script (separate from your function)
mImage = imread('2015_Data/Wavelength1/wavelength 1 t00.tif');
% Call the statistics function you just created to obtain the mean, median, and standard deviation.
[imageMean,imageMedian,imageStd] = ImageStats(mImage);
% Print the results.
disp(['The mean image intensity is: ' num2str(imageMean)])
disp(['The median image intensity is: ' num2str(imageMedian)])
disp(['The standard deviation of the image intensity is: ' num2str(imageStd)])
% alternate printing using printf
disp('===Alternative printing:===')
fprintf('The mean image intensity is %.2g\n',imageMean)
fprintf('The median image intensity is: %.2g\n',imageMedian)
fprintf('The standard deviation of the image intensity is: %.2g\n',imageStd)
