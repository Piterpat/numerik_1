function [z]=ha_1_2_g(x)
    [n,~]=size(x);
    z=zeros(n,1);
    for i=1:n
        if x(i,1) <= 3
            if x(i,1) >= 1
                z(i,1)=1;
            end
        end
    end
end