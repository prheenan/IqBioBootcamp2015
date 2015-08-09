function [ Output] = MyThresh( Image,NumCondition,SetEqualTo )
    % get a copy of the image
    Output = Image;
    % threshhold the output to what the use wants
    Output(Output < NumCondition) = SetEqualTo;
end

