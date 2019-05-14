%Funktion, we lche ein LGS Au=f für A Triagonalmatrix loest
%Vektor a ist Hauptdiagonale, b ist erste Nebendiagonale

function [u]=tridiagloes(a,b,f)
    
    [n,~] = size(a);
    u(n,1)=0;
    c(n,1)=0;
    d(n-1,1)=0;
    y(n,1)=0;
    
    %Cholesky Zerlegung
    %Matrix L hat diagonale c und erste Nebendiagonale d
    
    c(1)=sqrt(a(1));
    d(1)=b(1)/c(1);
    
    for i=2:n-1
        c(i)=sqrt(a(i)-(d(i-1).^2));
        d(i)=b(i)/c(i);
    end
    
    c(n)=sqrt(a(n)-(d(n-1).^2));
    
    %Loese Ly=f durch vorwaertseinsetzen
    
    y(1)=f(1)/c(1);
    
    for i=2:n
        y(i)=(f(i)-(d(i-1)*y(i-1)))/c(i);
    end
        
    %Loese L'u=y durch rueckwaertseinsetzen
    
    u(n)=y(n)/c(n);
    
    for m=n-1:-1:1
        u(m)=(y(m)-(d(m)*u(m+1)))/c(m);
    end
  