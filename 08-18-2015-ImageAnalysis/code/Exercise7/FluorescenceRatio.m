function [ MeanReturn,StdReturn ] = FluorescenceRatio( BlankA,BlankB,DataA,DataB )
% Background and flatfield correct the both wavelengths
    [~,~,~,CorrectedA] = MyBgFlatfield(BlankA,DataA);
    [~,~,~,CorrectedB] = MyBgFlatfield(BlankB,DataB);
    % get statistics for threshholding
    [MeanA,~,~] = ImageStats(CorrectedA);
    [MeanB,~,~] = ImageStats(CorrectedB);
 %For each corrected image, threshold anything less than one
    ThreshA = MyThresh(CorrectedA,(MeanA),0);
    ThreshB = MyThresh(CorrectedB,(MeanB),0);
%Calculate the ratio of the corrected, thresholded wavelengths 
    Ratio = ThreshA./ThreshB;
%Set all points in the ratio where you divided by zero to the value zero     
    Ratio(isnan(Ratio)) = 0;
%Create a new, 1-D array with only the non-zero elements in the ratio
    RatioNonZero = Ratio(Ratio > 0);
% Get the mean and standard deviation
    MeanReturn = mean(RatioNonZero);
    StdReturn = std2(RatioNonZero);
end

