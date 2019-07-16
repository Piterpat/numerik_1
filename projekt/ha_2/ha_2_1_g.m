function [z]=ha_2_1_g(x)
    [n,~]=size(x);
    z=zeros(n,1);
    for i=1:n
         if i > 80
             z(i,1)=10;
         else
             z(i,1)=4;
         end
    end
end