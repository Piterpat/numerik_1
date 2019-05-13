%LR-Zerlegung einer quadratischen Matrix A ohne Pivotisierung

function [L,R]=lr(A)
    [m,~]=size(A);
    L=eye(m);
    
    for i=1:m
        for ii=i+1:m
            L(ii,i)=A(ii,i)./A(i,i);
            A(ii,:) = A(ii,:) - A(i,:).*L(ii,i);
        end
    end
    
    R=A;
end
    
    