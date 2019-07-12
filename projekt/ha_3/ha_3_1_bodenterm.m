%bodenterm
% 0 - Wellenboden
% 1 - Schr�ge
% 2 - Stufe
B=zeros(N,M);

for i=1:M
    for ii=1:N
        
        if bodenart == 0
            B(i,ii)=sin(x(i).*pi);
        end
        
        if bodenart == 1
            B(i,ii)=(i+ii)/N;
        end
        
        if bodenart == 2
            if x(i)<0
                B(i,ii)=0.5;
            else
                B(i,ii)=1;
            end
        end
        
        if bodenart == 3
            B(i,ii)=x(i)^2+y(ii)^2;
        end
        
    end
end


dBy=zeros(N,M);
dBx=zeros(N,M);

dBx(2:end-1,2:end-1)=(B(3:end,2:end-1)-B(1:end-2,2:end-1))./(2.*dx);
dBy(2:end-1,2:end-1)=(B(2:end-1,3:end)-B(2:end-1,1:end-2))./(2.*dy);