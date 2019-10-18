% EOC testprogramm f�r Werte f�r 4.1
% L = analytisch, U= Upwind, W= Lax Wendroff
clear

N1 = 16;
N2 = 8;
i = 1;


while i<=8

    
[L1,U1,W1,deltax1] = ha_1_2(N1);
[L2,U2,W2,deltax2] = ha_1_2(N2);
LU2 = L2 - U2;
LU1 = L1 - U1;
LW2 = L2 - W2;
LW1 = L1 - W1;


pUp(i) = (log(norm((LU2(:,end)),inf)) - (log(norm(LU1(:,end),inf))))./ (log(deltax2) - log(deltax1));
pWend(i) = (log(norm(LW2(:,end),inf)) - (log(norm(LW1(:,end),inf))))./ (log(deltax2) - log(deltax1));


N1 = N1.*2;
N2 = N2 .*2;
i= i+1;
end
pUp
pWend

plot (pWend,'b')
hold on
plot (pUp,'g')
hold off
legend('Lax-Wendroff','Upwind')
axis([1 8 -1 1])
xlabel('Aufl�sungsnummer')
ylabel('EOC')
