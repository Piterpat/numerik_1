a1=[1;5];
a2=[-2;2];
s1=10;
s2=10;
l1=2;
l2=2;
m=1;
x0=[0 ;-4];

x=x_stat(a1,a2,s1,s2,l1,l2,m,x0);
disp(x);

%plot(a1(1),a1(2),'x','color','k')
%hold on
%plot(a2(1),a2(2),'x','color','k')
%plot(x0(1),x0(2),'o','color','b')
%plot(x(1),x(2),'o','color','g')
%hold off