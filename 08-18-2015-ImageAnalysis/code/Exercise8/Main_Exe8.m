clf;
close all;
% list the directories
mDirA = '../../../2015_Data/Wavelength1/';
mDirB = '../../../2015_Data/Wavelength2/';
% looking for extensions
mExt = '.tif';
BlankA = '2015_Data/BlankWells/blank_w1.tif';
BlankB = '2015_Data/BlankWells/blank_w2.tif';
% get the actual directories
DirReturnA = ListFilesWithExt( mDirA,mExt );
DirReturnB = ListFilesWithExt( mDirB,mExt );
nFiles = length(DirReturnA);
means = zeros(nFiles,1);
stdevs = zeros(nFiles,1);
% loop through, get each mean and standard deviation
for i=1:nFiles
   fullPathA = [mDirA DirReturnA(i).name];
   fullPathB = [mDirB DirReturnB(i).name];
   [MeanV,StdV]= FluorescenceRatio( BlankA,BlankB,fullPathA,fullPathB ); 
   means(i) = MeanV;
   stdevs(i) = StdV;
end
% GEnerate a 2D array
my2Darray = [ means, stdevs ] ;
% save  the 2D array
csvwrite('MeanStdevTime.csv',my2Darray);

figure()
fontsize=20;
errorbar(means,stdevs,'ro')
title('Intensity over time','FontSize',fontsize)
ylabel('Intensity (arbitrary)','FontSize',fontsize)
xlabel('Time (arbitrary)','FontSize',fontsize)

