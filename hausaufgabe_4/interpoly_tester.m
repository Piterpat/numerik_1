%testet die Funktion interpoly mit gegebenen Stuetzstellen
clear

a=-6;
b=6;
n=18;
%d=@(x) cos(x);
d=@(x) 1./(1+(x.^2));

%Stuetzstellen aequidistant
x_1=linspace(a,b,n)';
f_1=d(x_1);
c_1=interpoly(x_1,f_1);

%Stuetzstellen Tschebyscheff
x_2(n,1)=0;
for i=1:n
    x_2(i,1)=((a+b)/2) + ((b-a)/2).*cos(((2*i-1)/(2*n)).*pi);
end
f_2=d(x_2);

c_2=interpoly(x_2,f_2);

%Werte des Polynoms zum plotten berechnen
precision = 100;
x_3=linspace(a,b,precision)';
y_3=d(x_3);

%aequidistante interpoly funktion
y_1(precision,1)=0;
for i=1:precision
    for ii=1:n
        y_1(i,1)=y_1(i,1) + (c_1(ii,1).*x_3(i,1).^(n+1-ii));
    end
end

%tschebyscheff interpoly funktion
y_2(precision,1)=0;
for i=1:precision
    for ii=1:n
        y_2(i,1)=y_2(i,1) + (c_2(ii,1).*x_3(i,1).^(n+1-ii));
    end
end

subplot(2,1,1)
plot(x_3,y_3,'b')
hold on
plot(x_3,y_1,'k')
plot(x_1,f_1,'.','color','r')
hold off
axis([a b -5 5])
axis equal
title('Interpolation mit aequidistanten Stuetzstellen')

subplot(2,1,2)
plot(x_3,y_3,'b')
hold on
plot(x_3,y_2,'k')
plot(x_2,f_2,'.','color','r')
hold off
axis([a b -5 5])
axis equal
title('Interpolation mit Stuetzstellen nach Tschebyscheff')

