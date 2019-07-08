function [z]=ha_3_1_g(x,y)
    [n,~]=size(x);
    [m,~]=size(y);
    z=zeros(n,m);
    for i=1:n
        for ii=1:m
            
%              if ((x(i)^2)+(y(ii)^2)) <= 0.1
%                  z(i,ii)=7;
%              else
%                  z(i,ii)=4;
%              end
%             
%            if sqrt(x(i).*y(ii)) <= 0.5
%                z(i,ii)=6;
%            else
%                z(i,ii)=3+sqrt(x(i).*y(ii)).*3;
%            end
%            
%            if sqrt(x(i).*y(ii)) <= 0.5
%                z(i,ii)=1;
%            else
%                z(i,ii)=0.5;
%            end

%             z(i,ii)=(sin(5.*x(i)).*sin(5.*y(ii)))+5;

            if i > 80
                 z(i,ii)=10;
            else
                 z(i,ii)=4;
            end
        end
    end
end