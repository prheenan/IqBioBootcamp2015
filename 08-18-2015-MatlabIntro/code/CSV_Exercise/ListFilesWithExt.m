function [ DirReturn ] = ListFilesWithExt( Directory,Ext )
    % list all the files in a specific directory
    PathStr = [Directory '*' Ext];
    DirReturn =  dir(PathStr);
end

