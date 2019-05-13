%Funktion die mit L, R und b LRx=b l�st
%L ist untere Dreiecksmatrix, R ist obere Dreiecksmatrix
 
function x=vorrueck(L,R,b)
    [m,~]=size(L);
 
    y(m,1)=0;
    x(m,1)=0;
   
    %durch vorw�rtseinsetzten Ly=b
    for i=1:m
        c = 0;
        for ii=1:(i-1)
            c = c-(y(ii, 1).*L(i, ii));
        end
        y(i,1)=b(i,1)+c;
    end
   
    %durch r�ckw�rtseinsetzten Rx=y
    for i=1:m
        k=m+1-i;
        c = 0;
        for ii=k+1:m
            c = c-(x(ii, 1).*R(k, ii));
        end
        x(k,1)=(y(k,1)+c)./R(k, k);
    end
 
end