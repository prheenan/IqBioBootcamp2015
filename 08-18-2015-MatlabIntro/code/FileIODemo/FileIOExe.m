mOutFile = 'FileOut.csv';
% 5 rows, two columns
mArr = [ 2 1 ;
         0 1 ;
         5 4 ;
         7 8 ;
         9 10 ];
% write the file
csvwrite(mOutFile,mArr);
% read it back
mReadAgain = csvread(mOutFile);
     