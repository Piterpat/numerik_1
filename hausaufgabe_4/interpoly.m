%Funktion die zu gegebenen St�tzpunkten x mit zugeh�rigem f das zugeh�rige
%Interpolationspolynom berechnet und im Intervall plottet

function [c]=interpoly(x,f)

[n,~]=size(x);
A=zeros(n);

for i=1:n
    A(i,1)=1;
    for ii=2:n
        A(i,ii)=A(i,ii-1).*x(i,1);
    end
end

%cond(A)

c=flipud(A\f);