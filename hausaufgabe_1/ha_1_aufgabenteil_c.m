x=0:0.01:1;
subplot(2,1,1)
hold on
plot(x, sin(5*x),"Color",'k')
plot(x, cos(5*x),"Color",'k')
title('y=sin(5x) und y=cos(5x)','FontWeight','Normal')
axis([0 1 -2 2])
xticks(0:0.1:1)
yticks(-2:1:2)
xlabel('x')
ylabel('y')
grid on
set(gca,'box','on')
set(gca,'GridLineStyle',':')
set(gca, 'XColor', 'k')
set(gca, 'GridAlpha', 0.5)

x=-3:0.01:3;
subplot(2,1,2)
plot(x,sin(exp(x)),"Color",'k')
title('y=sin(exp(x))','FontWeight','Normal')
axis([-3 3 -1.5 1.5])
xticks(-3:1:3)
yticks(-1.5:0.5:1.5)
xlabel('x')
ylabel('y')
set(gca,'box','on')

%print('aufgabenteil_c','-dpng')
