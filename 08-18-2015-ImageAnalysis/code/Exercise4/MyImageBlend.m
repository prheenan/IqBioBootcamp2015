function [ OriginalImage,BlendedImage ] = MyImageBlend( mFile,num )
% load an image from a file and background correct it
   OriginalImage = imread(mFile);
   % note: imopen takes the already read *image*
   BlendedImage = imopen(OriginalImage,strel('disk',num));
end

