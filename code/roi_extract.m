function [select, coord] = roi_extract(array)
% [select, coord] = roi_extract(array)  Select and return region of interest
%
% Select and return image region of interest (ROI) via a GUI window and
% 'right-button-mouse' operation. If the mouse button is clicked and
%  released without movement, the entire displayed image will be selected.
%   array  (uint8)  - input image array(height, width [, ncolor])
%   select (double) - output ROI as an array(newlin, newpix[, ncolor])
%   coord is list of coordinates of ROI (upperleft(x,y),lowerright(x,y))
% Peter Burns 5 Aug. 2002
% Copyright (c) International Imaging Industry Association

dim = size(array);
height = dim(1);
width = dim(2);
% figure;
imtool(array,'InitialMagnification',100), 
title('Select ROI');

%axis off
 
junk=waitforbuttonpress;
ul=get(gca,'CurrentPoint');
final_rect=rbbox;
lr=get(gca,'CurrentPoint');
ul=round(ul(1,1:2));
lr=round(lr(1,1:2));

if ul(1,1) > lr(1,1);             % sort x coordinates
   mtemp = ul(1,1);
   ul(1,1) = lr(1,1);
   lr(1,1) = mtemp;
 end;
 if ul(1,2) > lr(1,2);             % sort y coordinates
   mtemp = ul(1,2);
   ul(1,2) = lr(1,2);
   lr(1,2) = mtemp;
 end; 

roi = [lr(2)-ul(2)  lr(1)-ul(1)];  % if del x,y <10 pixels, select whole array
if roi(1)<10;
    ul(2) =1;
    lr(2) =height;
 end;
 if roi(2)<10;
    ul(1) =1;
    lr(1) =width;
end;
select=array(ul(2):lr(2), ul(1):lr(1), :);
coord = [ul(:,:), lr(:,:)];
close;
