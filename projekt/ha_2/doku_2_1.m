N=10;
X=linspace(0,1,N);
plot(X,H,'b')
hold on
plot(X,h,'k')
plot(X,h-H,'r')
hold off
axis([0,1,-0.2,1.2])
print('doku_2_2_10','-dpng')