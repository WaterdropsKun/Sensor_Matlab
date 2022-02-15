function [r,gr,gb,b]=splitBayer(in,bayer_order)
o1=in(1:2:end,1:2:end);
o2=in(1:2:end,2:2:end);
o3=in(2:2:end,1:2:end);
o4=in(2:2:end,2:2:end);
switch(bayer_order)
   case 'rggb' 
       r = o1;
       gr = o2;
       gb = o3;
       b = o4;
     % [r,gr,gb,b]=[o1,o2,o3,o4];
      fprintf('rggb\n' );
   case 'bggr' 
       r = o4;
       gr = o3;
       gb = o2;
       b = o1;
     % [r,gr,gb,b]=[o4,o3,o2,o1];
      fprintf('bggr\n' );
   case 'grbg' 
       r = o2;
       gr = o1;
       gb = o4;
       b = o3; 
      %[r,gr,gb,b]=[o2,o1,o4,o3]; 
      fprintf('grbg\n' );
   case 'gbrg'
       r = o3;
       gr = o4;
       gb = o1;
       b = o2;
       %  [r,gr,gb,b]=[o3,o4,o1,o2]; 
      fprintf('gbrg\n' );
   otherwise
      fprintf('Invalid order\n' );
 end

