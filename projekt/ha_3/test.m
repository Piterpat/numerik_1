         

xmin=0;
xmax=10;
ymax=20;
ymin=0;
n=100;
m=200;
x=linspace(xmin,xmax,n)';
y=linspace(ymin,ymax,m)';

randkarte=zeros(n,m);
for i=1:n
    for ii=1:m
        randkarte(i,ii)=0;

        if (y(ii)>7 && y(ii)<10.5) && (x(i)>2 && x(i)<3.5)
            randkarte(i,ii)=1;
        elseif (y(ii)>8.5 && y(ii)<11) && (x(i)>5 && x(i)<8)
            randkarte(i,ii)=1;
        elseif (y(ii)>13 && y(ii)<14) && (x(i)>6 && x(i)<7)
            randkarte(i,ii)=1;
        elseif (y(ii)>14 && y(ii)<16.5) && (x(i)>8 && x(i)<9.5)
            randkarte(i,ii)=1;
        elseif (y(ii)>13.5 && y(ii)<16.5) && (x(i)>1 && x(i)<3.5)
            randkarte(i,ii)=1;        
        elseif (y(ii)>15 && y(ii)<16) && (x(i)>1 && x(i)<2.5)
            randkarte(i,ii)=1;
        elseif (y(ii)>16 && y(ii)<17.5) && (x(i)>1 && x(i)<3.5)
            randkarte(i,ii)=1;
        end

        if i==1 || i==n || ii==m
            randkarte(i,ii) = 1;
        end

        if ii == 1
            randkarte(i,ii) = 3;
        end
    end
end
plot(randkarte)
view(45,45)

%             if (y(ii)>5 && y(ii)<9) && (x(i)>3.5 && x(i)<6.5)
%             randkarte(i,ii)=1;
