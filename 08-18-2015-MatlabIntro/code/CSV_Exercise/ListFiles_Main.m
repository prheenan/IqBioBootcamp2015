mDir = '../../2015_Data/Wavelength2/';
mExt = '.tif';
mFiles = ListFilesWithExt(mDir,mExt);
% get the number of files
nFiles = length(mFiles);
for i=1:nFiles
    disp(mFiles(i).name);
end
