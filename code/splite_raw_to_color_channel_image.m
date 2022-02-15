function [B,Gb,Gr,R] = splite_raw_to_color_channel_image( frame ,raw_oder )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
[sy,sx] = size(frame);
B = zeros(sy,sx);
Gb = zeros(sy,sx);
Gr = zeros(sy,sx);
R = zeros(sy,sx);
if(raw_oder=='3')
B(1:2:(sy-1),1:2:(sx-1))=frame(1:2:(end-1),1:2:(end-1));
Gb(1:2:(sy-1),2:2:sx)=frame(1:2:(end-1),2:2:end);
Gr(2:2:sy,1:2:sx)=frame(2:2:end,1:2:(end-1));
R(2:2:sy,2:2:sx)=frame(2:2:end,2:2:end);
end

if(raw_oder=='4')
R(1:2:(sy-1),1:2:(sx-1))=frame(1:2:(end-1),1:2:(end-1));
Gr(1:2:(sy-1),2:2:sx)=frame(1:2:(end-1),2:2:end);
Gb(2:2:sy,1:2:(sx-1))=frame(2:2:end,1:2:(end-1));
B(2:2:sy,2:2:sx)=frame(2:2:end,2:2:end);
end
if(raw_oder=='1')
Gb(1:2:(sy-1),1:2:(sx-1))=frame(1:2:(end-1),1:2:(end-1));
B(1:2:(sy-1),2:2:sx)=frame(1:2:(end-1),2:2:end);
R(2:2:sy,1:2:(sx-1))=frame(2:2:end,1:2:(end-1));
Gr(2:2:sy,2:2:sx)=frame(2:2:end,2:2:end);
end
if(raw_oder=='2')
Gr(1:2:(sy-1),1:2:(sx-1))=frame(1:2:(end-1),1:2:(end-1));
R(1:2:(sy-1),2:2:sx)=frame(1:2:(end-1),2:2:end);
B(2:2:sy,1:2:(sx-1))=frame(2:2:end,1:2:(end-1));
Gb(2:2:sy,2:2:sx)=frame(2:2:end,2:2:end);
end
