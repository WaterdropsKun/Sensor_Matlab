function [ RGB ] = bilinear_process( frame,raw_oder,format )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
 [B,Gb,Gr,R] = splite_raw_to_color_channel_image( frame,raw_oder);%���������ʽ�������ذ���ɫ����д��RGB��ɫ������
 G=Gb+Gr;
 m = [0 1 0; 1 4 1; 0 1 0] ./ 4;
 G = conv2(G,m,'same');
 mb = [0.5 1 0.5];
 R = conv2(R,mb,'same');%��һ�ξ���������������R����
 R = conv2(R,mb','same');%�ڶ��ξ���������ż����R����
 
 B = conv2(B,mb,'same');
 B = conv2(B,mb','same');
 
 RGB=R;
 RGB(:,:,2)=G;
 RGB(:,:,3)=B;
 RGB=round(RGB);
 if(format~='5')
    RGB=uint8(RGB);
 else
     RGB=uint16(RGB);
 end


end

