% EOC testprogramm für Werte für 4.1
% L = analytisch, U= Upwind, W= Lax Wendroff
clear

N1 = 8;
N2 = 16;
i = 1;

while i<=12
    
[L1,U1,W1,deltax1] = ha_1_2(N1);
[L2,U2,W2,deltax2] = ha_1_2(N2);
LU2 = L2-U2;
LU1 = L1 - U1;
LW1 = L2 - W2;
LW2 = L1 - W1;

pUp(i) = (log(norm((abs(LU2)),inf)) - (log(norm(abs(LU1),inf))))./ (log(deltax2) - log(deltax1));
pWend(i) = (log(norm(abs(LW2),inf)) - (log(norm(abs(LW1),inf))))./ (log(deltax2) - log(deltax1));

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
axis([1 10 -0.5 0.5])
xlabel('Auflösungsnummer')
ylabel('EOC')
