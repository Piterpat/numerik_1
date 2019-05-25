%Funktion ohne Ausgabe, welche eine gegebene Funktion
%im Intervall a bis b mit dem Differentenquotienten und gegebenem h
%2 mal ableitet und dann plottet.

function []=ableitungsplot(f,a,b,n,h)
    x=linspace(a,b,n);
    f_0=f(x);
    f_1=((f(x+h)-f(x-h)))/2*h;
    f_2=((f(x-h)-(2*f(x))+f(x+h)))/(h.^2);
    
    subplot(3,1,1)
    plot(x,f_0)
    title('f(x)')
    
    subplot(3,1,2)
    plot(x,f_1)
    title('1. Ableitung')
    
    subplot(3,1,3)
    plot(x,f_2)
    title('2. Ableitung')
end