function initMIPI10Parameters(width, height)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

global MIPI10_Packet_length;
MIPI10_Packet_length = 5;  % ÿ��packet5�ֽڣ�4����
global MIPI10_Packet_pixels;
MIPI10_Packet_pixels = 4;
global M_Packet_length;
M_Packet_length = 5;
global MIPI10line_length;
MIPI10line_length = calculate_MIPI10line_bytes(width);


function size_in_bytes = calculate_MIPI10line_bytes(width)
global MIPI10_Packet_length;
width = floor((width+3)/4)*4;  % ������Ӧ�ñ�4������������ȡ������Ҫ��
size_in_bytes = (width/4)*MIPI10_Packet_length;  % �������ÿ�������������ÿ���ֽ���
size_in_bytes = floor((size_in_bytes+7)/8)*8;  % ��֤ÿ��8�ֽڶ��룬ͼ���в���8�ֽڵĻᲹ��
