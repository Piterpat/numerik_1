clear 

G=[0; -9.81];
a1=[0;0];
a2=[1;1];
s=10;
l=2;
m=1;
x=[0;-4];
tol= 0.0000001.*[1;1];
z=[0;0];

while norm(x-z) > norm(tol)
    z=x;
    
    F1= s*(l/norm(z-a1)-1)*(z-a1);
    F2= s*(l/norm(z-a2)-1)*(z-a2);
    
    H1=s*((l/norm(z-a1)-1)*eye(2)-l*((z-a1)*((z-a1)') /(norm(z-a1))^3));
    H2=s*((l/norm(z-a2)-1)*eye(2)-l*((z-a2)*((z-a2)') /(norm(z-a2))^3));
    
    F=F1+F2+G;
    J=H1+H2;
    
    if (det(J)~=0)
        x=z-(J\F);
    end
end
x