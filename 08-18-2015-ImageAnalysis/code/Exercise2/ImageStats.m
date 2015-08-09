function [ MeanVal,MedianVal,StdVal ] = ImageStats( mImage )
%a function (in a new file) which calculatesthe mean,median,
% and standard deviation of an input image
% note: mean2 and std2 are specific for images
% we could also just slice entire image (see median)
    MeanVal = mean2(mImage); 
    MedianVal = median(mImage(:));
    StdVal = std2(mImage);
end

