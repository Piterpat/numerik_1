%Funktion die zu gegebenen Stützpunkten x mit zugehörigem f das zugehörige
%Interpolationspolynom berechnet und im Intervall plottet

function [c]=interpoly(x,f)

[n,~]=size(x);
A=zeros(n);

for i=1:n
    for ii=1:n
        A(i,ii)=x(i,1).^(n+1-ii);
    end
end

%cond(A)

c=A\f;