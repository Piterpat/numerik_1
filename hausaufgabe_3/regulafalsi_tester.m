f = @(x)  1 + cos(x).*cosh(x);
x=regulafalsi(f,1,2,0.01);

disp(x)


x=1:0.01:10;
plot(x,1 + cos(x).*cosh(x))