clear
n=3;
for i=1:n-1
    a(i,1)=2;
    b(i,1)=-1;
    f(i,1)=1;
end
a(n,1)=2;
f(n,1)=1;
    
A=diag(a);
for i=1:n-1
    A(i+1,i)=b(i);
    A(i,i+1)=b(i);
end


u1= tridiagloes(a,b,f)
u2= A\f