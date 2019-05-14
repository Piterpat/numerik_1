function ente(A)
ente = [0 1 1 1.5 2.5 3 3 4 2 2 1 -3.7 -5 -4 -3 0;
        1 0 3.5 4 4 3.5 3 3 2 -1 -2 -2 1 0 1 1];
t = linspace(0,2.*pi,1000);
kreis = [7 .* cos(t);
         7 .* sin(t)]; 
[U,S,V] = svd(A);
ente_V = V.' * ente;
ente_S = S * ente_V;
ente_U = A * ente;
kreis_V = V.' * kreis;
kreis_S = S * kreis_V;
kreis_U = A * kreis;




p1 = subplot(1,4,1);
plot (p1, ente(1,:),ente(2,:),'k',kreis(1,:),kreis(2,:),'k')
ylim ([-10 10]);
xlim ([-10 10]);
xticks ([-10 0 10])
yticks ([-10 0 10])

title ('Ausgangsbild','FontWeight','normal');
grid on
grid minor
axis square

p2 = subplot(1,4,2);
plot (p2, ente_V(1,:),ente_V(2,:),'k',kreis_V(1,:),kreis_V(2,:),'k')
ylim ([-10 10]);
xlim ([-10 10]);
xticks ([-10 0 10])
yticks ([-10 0 10])

title ('nach orth. Trafo. V^{T}','FontWeight','normal');
grid on
grid minor
axis square

p3 = subplot(1,4,3);
plot (p3, ente_S(1,:),ente_S(2,:),'k',kreis_S(1,:),kreis_S(2,:),'k')
ylim ([-10 10]);
xlim ([-10 10]);
yticks ([-10 0 10])
xticks ([-10 0 10])

title ('nach Streckung \Sigma','FontWeight','normal');
grid on
grid minor
axis square

p4 = subplot(1,4,4);
plot (p4, ente_U(1,:),ente_U(2,:),'k',kreis_U(1,:),kreis_U(2,:),'k')
ylim ([-10 10]);
xlim ([-10 10]);
xticks ([-10 0 10]);
yticks ([-10 0 10])

title ('nach orth. Trafo. U','FontWeight','normal');
grid on
grid minor
axis square
