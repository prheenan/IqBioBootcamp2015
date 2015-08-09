function [ OriginalImage, BgCorrectedImage ] = MyBgCorrect( OriginalImage )
%Load in an image (see previous exercise)
%Background corrects the image, using either the mean or median 
    % not using the median or standard deviayion
    [MeanV,~,~] = ImageStats(OriginalImage);
    BgCorrectedImage = OriginalImage - MeanV;
end

