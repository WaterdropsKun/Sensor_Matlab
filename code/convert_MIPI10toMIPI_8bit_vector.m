function [MIPIframe] = convert_MIPI10toMIPI_8bit_vector(Qframe, width, height)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

initMIPI10Parameters(width, height);
global MIPI10line_length;
global MIPI10_Packet_pixels;
width_new = floor((width+3)/4)*4;  % 像素数应该被4整除，否则上取至符合要求
MIPI10_Packet_NUM = width/MIPI10_Packet_pixels;  % 一行中的PACKET数
MIPIframe = [];
Qframe_new = reshape(Qframe(1:MIPI10line_length*height), MIPI10line_length, height);
Qframe_new = Qframe_new';

MIPIframe(1:height, 1:4:width) = Qframe_new(1:height, 1:5:MIPI10_Packet_NUM*5);  % 右边：把每个PACKET的第一个字节存入矩阵；左边：把每个PACKET第一个像素写入显示矩阵
MIPIframe(1:height, 2:4:width) = Qframe_new(1:height, 2:5:MIPI10_Packet_NUM*5);  % 右边：把每个PACKET的第二个字节存入矩阵；左边：把每个PACKET第二个像素写入显示矩阵
MIPIframe(1:height, 3:4:width) = Qframe_new(1:height, 3:5:MIPI10_Packet_NUM*5);  % 右边：把每个PACKET的第三个字节存入矩阵；左边：把每个PACKET第三个像素写入显示矩阵
MIPIframe(1:height, 4:4:width) = Qframe_new(1:height, 4:5:MIPI10_Packet_NUM*5);  % 右边：把每个PACKET的第四个字节存入矩阵；左边：把每个PACKET第四个像素写入显示矩阵
FRAME_byte_5 = Qframe_new(1:height, 5:5:MIPI10_Packet_NUM*5);  % 右边：把每个PACKET的第五个字节存入矩阵；左边：不写入，舍弃

end
