function [BlankImage, DataImage,FlatfieldCorrected,BackgroundAndFlatField] = ...
                 MyBgFlatfield( BlankWell,DataWell )
    BlankImage = imread(BlankWell);
    DataImage = imread(DataWell);
    FlatfieldCorrected = DataImage-BlankImage;
    BackgroundAndFlatField = MyBgCorrect(FlatfieldCorrected);
end

