function [ frame ] = read_QBayer_10bit_file( filename,width,height)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
f=fopen(filename);
% D=dir(filename);
frame=fread(f,'uint8');
fclose(f);

end

