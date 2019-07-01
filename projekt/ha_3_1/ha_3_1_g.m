function [z]=ha_3_1_g(x,y)
    [n,~]=size(x);
    [m,~]=size(y);
    z=zeros(n,m);
    for i=1:n
        for ii=1:m
            if sqrt(x(i).*y(ii)) <= 0.5
                z(i,ii)=1;
            else
                z(i,ii)=0.5;
            end
        end
    end
end