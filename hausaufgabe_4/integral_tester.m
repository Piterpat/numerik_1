f=@(x) x.^2+10;
a=1;
b=2;
n=10;

[T,S]=integral(f,a,b,n);
disp(T)
disp(S)