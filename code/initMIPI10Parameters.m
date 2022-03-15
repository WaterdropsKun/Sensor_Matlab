function initMIPI10Parameters(width, height)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global MIPI10_Packet_length;
MIPI10_Packet_length = 5;  % 每个packet5字节，4像素
global MIPI10_Packet_pixels;
MIPI10_Packet_pixels = 4;
global M_Packet_length;
M_Packet_length = 5;
global MIPI10line_length;
MIPI10line_length = calculate_MIPI10line_bytes(width);


function size_in_bytes = calculate_MIPI10line_bytes(width)
global MIPI10_Packet_length;
width = floor((width+3)/4)*4;  % 像素数应该被4整除，否则上取至符合要求
size_in_bytes = (width/4)*MIPI10_Packet_length;  % 由输入的每行像素数计算出每行字节数
size_in_bytes = floor((size_in_bytes+7)/8)*8;  % 保证每行8字节对齐，图像中不够8字节的会补零
