function [x]=x_stat(a1,a2,s1,s2,l1,l2,m,x0,tol)
    
    g=9.81;
    x=x0;
    z=x+tol;
    while norm(x-z)>norm(tol)
        f1= -s1.*(norm(x-a1)-l1)*((x-a1)/(norm(x-a1)));
        f2= -s2.*(norm(x-a2)-l2)*((x-a2)/(norm(x-a2)));
        G=[0;-g.*m];
        f1strich=s1.*((((l1./norm(x-a1))-1)*eye(2))-l1.*(((x-a1)*(x-a1)') /(norm(x-a1))^3));
        f2strich=s2.*((((l2./norm(x-a2))-1)*eye(2))-l2.*(((x-a2)*(x-a2)') /(norm(x-a2))^3));

        fges=f1+f2+G;
        fstrich=f1strich + f2strich;

        z=x;
        x=x-(fstrich \ fges);
    end
    
end
    