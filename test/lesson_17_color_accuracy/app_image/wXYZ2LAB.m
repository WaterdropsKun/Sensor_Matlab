function lab = wXYZ2LAB(XYZ,ref)
%This function converts CIEXYZ values to CIELAB
% Input: nx3, 0.0~0.1;
% ref: reference white value, D50 is default

if ~isfloat(XYZ)
    error('input must be float of 0.0 ~ 1.0.');
end

if strcmp(ref,'D50')
    refWhite = [0.9642,1.0000,0.8252];
elseif strcmp(ref,'D65')
    refWhite = [0.9504,1.0000,1.0889];
elseif strcmp(ref, 'A')
    refWhite = [1.0985, 1.0000,0.3558];
else
    error('Unknow reference White.');
end

%Compute X/Xn,Y/Yn,Z/Zn
s = size(XYZ);
lab = zeros(s(1),s(2));

xx = XYZ(:,1) ./ refWhite(1);
yy = XYZ(:,2) ./ refWhite(2);
zz = XYZ(:,3) ./ refWhite(3);

for i = 1:s(1)
    if (yy(i) <= 0.008856)
        lab(i,1) = 116*(7.787 * yy(i) + 0.1379) -16;
    else
        lab(i,1) = 116 * power(yy(i), 1/3) - 16;
    end
    
    if (xx(i) <= 0.008856)
        lab(i,2) = 500 * ((7.787 * xx(i) + 0.1379)  - (7.787 * yy(i) + 0.1379));
    else
        lab(i,2) = 500 *(power(xx(i),1/3) - power(yy(i), 1/3));
    end
    
    if (zz(i) <= 0.008856)
        lab(i,3) = 200 * ((7.787 * yy(i) + 0.1379)  - (7.787 * zz(i) + 0.1379));
    else
        lab(i,3) = 200 * (power(yy(i),1/3) - power(zz(i), 1/3));
    end
end
end
