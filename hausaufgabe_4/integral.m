%Funktion zur Berechnung des Integrals
%mit der Trapezregel (erste Ausgabe)
%mit der Simpsonregel (zweite Ausgabe)

function [T,S]=integral(f,a,b,n)
    h=(b-a)/(n-1);
    
    %Trapezregel
    c=0;
    for i=1:n-2
        c=c+f(a+(i*h));
    end
    T=h*(0.5*(f(a)+f(b))+c);
    
    %Simpsonregel
    S=0;
    x=a;
    for i=1:n-1
       S=S+((h/6)*(f(x)+(4*f(((2*x)+h)/2))+f(x+h)));
       x=x+h;
    end
end