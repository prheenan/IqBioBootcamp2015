% Note: we need to change directories to the
% FileIO directory
MyFile = 'ReadIn.csv';
%read our file into an array
MyArrayOriginal = csvread(MyFile);
%display the array
disp(MyArrayOriginal);
%add one to each value in the array
MyArrayOut = MyArrayOriginal + 1;
% write out the array
MyFileOut = 'ReadOut.csv';
csvwrite(MyFileOut,MyArrayOut);
% read back in what we wrote out,
% to make sure that we added one
MyArrayPlusOne = csvread(MyFileOut);
% should be all ones!
disp(MyArrayPlusOne-MyArrayOriginal);