function [  ] = ReadAndDisplay( mFileName )
% Reads in 'mFileName' and displays it as an image
    mImage = ReadImage(mFileName);
    imshow(mImage)
end

