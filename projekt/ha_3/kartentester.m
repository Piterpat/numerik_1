%100x100 Matrix mit nur aussenrand
BK = zeros(100,100);
 [lol,yikes]= size(BK);
 for i=1:lol
     BK(i,1) = 3; 
 end
 for i=1:lol
     BK(1,lol) = 3; 
 end
 for i=1:lol
     BK(100,lol) = 3; 
 end
 for i=1:lol
     BK(lol,100) = 3; 
 end

  
 
%  Ind1
%  Ind2x
%  Ind2y
%  Ind3
%  Ind4x
%  Ind4y
%  Ind5
%  Ind6x
%  Ind6y
%  Ind7
%  Ind8x
%  Ind8y