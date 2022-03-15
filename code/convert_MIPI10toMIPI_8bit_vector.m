function [MIPIframe] = convert_MIPI10toMIPI_8bit_vector(Qframe, width, height)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

initMIPI10Parameters(width, height);
global MIPI10line_length;
global MIPI10_Packet_pixels;
width_new = floor((width+3)/4)*4;  % ������Ӧ�ñ�4������������ȡ������Ҫ��
MIPI10_Packet_NUM = width/MIPI10_Packet_pixels;  % һ���е�PACKET��
MIPIframe = [];
Qframe_new = reshape(Qframe(1:MIPI10line_length*height), MIPI10line_length, height);
Qframe_new = Qframe_new';

MIPIframe(1:height, 1:4:width) = Qframe_new(1:height, 1:5:MIPI10_Packet_NUM*5);  % �ұߣ���ÿ��PACKET�ĵ�һ���ֽڴ��������ߣ���ÿ��PACKET��һ������д����ʾ����
MIPIframe(1:height, 2:4:width) = Qframe_new(1:height, 2:5:MIPI10_Packet_NUM*5);  % �ұߣ���ÿ��PACKET�ĵڶ����ֽڴ��������ߣ���ÿ��PACKET�ڶ�������д����ʾ����
MIPIframe(1:height, 3:4:width) = Qframe_new(1:height, 3:5:MIPI10_Packet_NUM*5);  % �ұߣ���ÿ��PACKET�ĵ������ֽڴ��������ߣ���ÿ��PACKET����������д����ʾ����
MIPIframe(1:height, 4:4:width) = Qframe_new(1:height, 4:5:MIPI10_Packet_NUM*5);  % �ұߣ���ÿ��PACKET�ĵ��ĸ��ֽڴ��������ߣ���ÿ��PACKET���ĸ�����д����ʾ����
FRAME_byte_5 = Qframe_new(1:height, 5:5:MIPI10_Packet_NUM*5);  % �ұߣ���ÿ��PACKET�ĵ�����ֽڴ��������ߣ���д�룬����

end
