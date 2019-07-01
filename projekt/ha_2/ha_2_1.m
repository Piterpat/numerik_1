%numerischer löser einer eindimensionalen 
%Erhaltungsgleichung mithilfe des
%Erhaltungsschemas
ha_2_1_set

while t<e
    
    %0) Plotten
    plot(x,H,'k')
    axis([l,r,low,up])
    drawnow
    
    %!! +((HU./H).^2)
    
    %1) CFL Bedingung
    a=max(abs(HU./H)+abs(sqrt(g.*H)));
    dt=CFL.*(dx./a);
    
    %2) Flussgroessen Zellmittelpunkt
    F1=HU;
    F2=(((HU).^2)./H)+(0.5.*g.*(H.^2));
    
    %!! Plus oder minus?
    
    %3) Approximation der Flussgroessen
    %an den Zellwaenden
    m=dx./(2.*dt);
    F1h=(m.*(H(1:end-1)-H(2:end)))...
        +(0.5.*(F1(1:end-1)+F1(2:end)));
    F2h=(m.*(HU(1:end-1)-HU(2:end)))...
        +(0.5.*(F2(1:end-1)+F2(2:end)));
    
    %!! Bodeterm nachtragen
    
    %4) Erhaltungsschema
    H(2:end-1)=H(2:end-1)...
        -((dt./dx).*(F1h(2:end)-F1h(1:end-1)));
    HU(2:end-1)=HU(2:end-1)...
        -((dt./dx).*(F2h(2:end)-F2h(1:end-1)))...
        +0;
    
    %5) Randbedingungen
    H(1)=H(2);
    H(end)=H(end-1);
    HU(1)=HU(2);
    HU(end)=HU(end-1);
    
    
    t=t+dt;
    n=n+1;
end

ha_2_1_video