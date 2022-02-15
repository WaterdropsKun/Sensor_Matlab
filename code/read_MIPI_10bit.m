function frame = read_MIPI_10bit( filename,width,height)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

f=fopen(filename);
% D=dir(filename);
frame=fread(f,'uint8');
fclose(f);





