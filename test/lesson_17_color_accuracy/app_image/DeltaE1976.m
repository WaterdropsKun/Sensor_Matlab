function out = DeltaE1976(lab1,lab2)
%This function calculates color differences based on CIE 1976 
%lab1 and lab2 should both be nx3 double matrix
%the result will be a nx8 matrix: 
%deltaE, deltaL,deltaA,deltaB,deltaC,deltaH,Chroma1,Chroma2

deltaL = lab1(:,1) - lab2(:,1);
deltaA = lab1(:,2) - lab2(:,2);
deltaB = lab1(:,3) - lab2(:,3);

ch1 = (lab1(:,2) .^2 + lab1(:,3) .^2) .^0.5;
ch2 = (lab2(:,2) .^2 + lab2(:,3) .^2) .^0.5;
deltaC = ch1 -ch2;
%hue1 = (180/pi) * atan(lab1(:,3) ./ lab1(:,2));
%hue2 = (180/pi) * atan(lab2(:,3) ./ lab2(:,2));

deltaE = (deltaL .^2 + deltaA .^2 + deltaB .^2) .^ 0.5;
deltaH = (deltaE .^2 - deltaL .^2 - deltaC .^2) .^ 0.5;

%out = [deltaE, deltaL,deltaA,deltaB,deltaC,deltaH,ch1,ch2];
out = [deltaE, deltaL,deltaA,deltaB,deltaC];
end