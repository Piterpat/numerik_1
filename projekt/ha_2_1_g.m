function [z]=ha_2_1_g(x)
    [n,~]=size(x);
    z=zeros(n,1);
    for i=1:n
        if x(i,1) <= 0.5
            z(i,1)=1;
        else
            z(i,1)=0.5;
        end
    end
end