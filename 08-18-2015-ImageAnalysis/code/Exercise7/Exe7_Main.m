BlankA = '2015_Data/BlankWells/blank_w1.tif';
BlankB = '2015_Data/BlankWells/blank_w2.tif';
DataA = 'wavelength 1 t00.tif';
DataB = 'wavelength 2 t00.tif';
[MeanV,StdV]= FluorescenceRatio( BlankA,BlankB,DataA,DataB );
fprintf('The mean / std of the data is %.2g/%.2g\n',MeanV,StdV)