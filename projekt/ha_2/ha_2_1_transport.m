%numerischer löser einer eindimensionalen 
%Erhaltungsgleichung mithilfe des
%Erhaltungsschemas
ha_2_1_set

 while t<e
    %0) Plotten
    if ~ishghandle(fig)
        break
    end
    plot(x,H,'k')
    hold on
    plot(x,S,'r')
    hold off
    axis([l,r,low,up])
    axis square
    xlabel('Y')
    ylabel('H')
    box off
    drawnow
    Frames(n) = getframe(gcf);
    
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
    
    %transport
    U=HU./H;
    Ap=(U+abs(U))./2;
    An=(U-abs(U))./2;
    Cp=Ap.*(dt./dx);
    Cn=An.*(dt./dx);
    
    S(2:end-1)=S(2:end-1)-Cp(2:end-1).*(S(2:end-1)-S(1:end-2))-Cn(2:end-1).*(S(3:end)-S(2:end-1));
        
    
    %5) Randbedingungen
    H(1)=H(2);
%     H(1)=sin(t*40).*0.03+1;
    H(end)=H(end-1);
    HU(1)=-HU(2);
    HU(end)=-HU(end-1);
    
    
    t=t+dt;
    n=n+1;
 end

ha_2_1_video