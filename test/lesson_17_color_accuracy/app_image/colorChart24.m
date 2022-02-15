function cors = colorChart24(image,ratio)
%CORS = COLORCHART24(IMAGE,RATIO) reads color check 24 color
%charts, returns coordinates of each color patch.
%   Inputs:
%   image, the image contains color checker 24 charts, normally capture by
%   camera under certain illuminant, i.e. D65.
%   ratio, crop ratio of each color patch, 0.7 is default, and this should
%   not be less than 0.5;
%   Outputs:
%   cors, a 4 by 6 by 4 elements matrix containning coordinates of color
%   patches, in cors, the first and third elements are the starting position
%   and the sencond and fourth are ending postion.
%
%Example: get #7 color patch and show all patches in seperate window  
%   im = imread('colorChecer_d65.jpg');
%   p = colorChart24(im);
%   patch7 = im(p(2,1,1):p(2,1,2), p(2,1,3):p(2,1,4),:)
%   for j = 1:4
%       for i = 1:6
%           figure,imshow(im(p(j,i,1):p(j,i,2), p(j,i,3):p(j,i,4),:));
%       end
%   end
%
%Author: Pengfei.Wang
%Bug report: chinafigo59@163.com

    switch nargin
        case 2
            roiRatio = ratio;
        case 1
            roiRatio = 0.7;%default roi 49% of patch area
        case 0
            disp('Input error, at least one parameter should be specified.');
    end
    %corase crop
    figure, imshow(image);
    title('Locate the four crosses on the chart, then double click within the area.');
    handle1 = imrect;
    pos = wait(handle1);
    pos = ceil(pos);
    close;
    %cropped image
    %chart = image(pos(2):(pos(2) + pos(4)),pos(1) : pos(1) + pos(3),:);
    %get patch size by ratio
    topleft = round(pos(3) * 0.004);
    patch = round(pos(3) * 0.1475);%patch size is 14.5% of image width
    gap = round(pos(3) * 0.02);%gap between adjacent patches is 2% of image width
    %roiRatio  = 0.7;% 0.7 x 0.7 = 0.49 = 49% of the patch is calculated
    roi = round(patch * roiRatio);
    cors = zeros(4,6,4);
     for j = 1:4
         for i = 1:6
             cors(j,i,1) =pos(2)+ topleft + (patch + gap)*(j-1) + (patch - roi);%row, x1
             cors(j,i,2) =pos(2)+ topleft + (patch + gap)*(j-1) + roi;%row x2
             cors(j,i,3) =pos(1) + topleft + (patch + gap)*(i-1) + (patch - roi);%y1
             cors(j,i,4) =pos(1) + topleft + (patch + gap)*(i-1) + roi;%y2
         end
     end
     %display 
    figure,imshow(image);
    hold on
    %cors = reshape(cors,24,4);
 for m = 1:4
     for k = 1:6
          rectangle('Position',[cors(m,k,3) cors(m,k,1) (cors(m,k,2)-cors(m,k,1))...
              (cors(m,k,4)-cors(m,k,3))],'LineWidth',1);
     end
 end
end