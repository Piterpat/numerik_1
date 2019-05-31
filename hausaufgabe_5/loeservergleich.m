%MATLAB-Funktion loeservergleich, welche das AWP im Intervall 0 bis 50 mit
%dem expliziten Eulerverfahren, dem Collatzverfahren und dem Heunverfahren
%löst und die Lösung in ein Diagramm plottet

function []=loeservergleich(h)
%y_strich=cos(t)y(t)
%y(0)=1

%untere Grenze
a=0;
%obere Grenze
b=50;
p=(b-a)/h;
%Laufvariable 
x=linspace(a,b,p)';
y_1=zeros(p,1);
y_1(1,1)=1;
y_2=zeros(p,1);
y_2(1,1)=1;
y_3=zeros(p,1);
y_3(1,1)=1;


%exakte Lösung
f=@(x) exp(1).^(sin(x));
%Euler explizit
for i=1:p-1
   y_1(i+1,1)=y_1(i,1)+(h.*cos(i.*h).*y_1(i,1));
end
%Collatzverfahren
for i=1:p-1
   y_2(i+1,1)=y_2(i,1)+(h.*cos((i.*h)+(h/2)).*(y_2(i,1)+(h./2).*(cos(i.*h).*y_2(i,1))));
end
%Heunverfahren
for i=1:p-1
    y_3(i+1,1)=y_3(i,1)+((h./2).*(cos(i.*h).*y_3(i,1)+cos((i.*h)+h).*(y_3(i,1)+(h.*cos(i.*h).*y_3(i,1)))));
end
    
%Plotten der exakten Lösung
plot(x,f(x),'k')
hold on
%explizit Euler
plot(x,y_1,'b')
%Collatzverfahren
plot(x,y_2,'g')
%Heunverfahren
plot(x,y_3,'r')
hold off
