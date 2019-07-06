%numerischer löser einer eindimensionalen 
%Erhaltungsgleichung mithilfe des
%Erhaltungsschemas
ha_3_1_set

while t<e

    %0) Plotten
    if ~ishghandle(fig)
        break
    end
    surf(x,y,H)
    axis(axis_set)
    view(45,45)
    caxis(caxis_set)
    %colorbar
    drawnow

    %1) CFL Bedingung
    a=max([max(abs(HU./H)+abs(sqrt(g.*H+(HU./H).^2))),...
        max(abs(HV./H)+abs(sqrt(g.*H+(HV./H).^2)))]);
    dt=CFL.*(min([dx,dy])./a);
    
    %2) Flussgroessen Zellmittelpunkt
    F1=HU;
    F2=(((HU).^2)./H)+(0.5.*g.*(H.^2));
    F3=HU.*(HV./H);
    
    G1=HV;
    G2=HU.*(HV./H);
    G3=(((HV).^2)./H)+(0.5.*g.*(H.^2));
    
    
    %!! Plus oder minus?
    
    %3) Approximation der Flussgroessen
    %an den Zellwaenden
    m=dx./(4.*dt);
    F1h=(m.*(H(1:end-1,:)-H(2:end,:)))...
        +(0.5.*(F1(1:end-1,:)+F1(2:end,:)));
    F2h=(m.*(HU(1:end-1,:)-HU(2:end,:)))...
        +(0.5.*(F2(1:end-1,:)+F2(2:end,:)));
    F3h=(m.*(HV(1:end-1,:)-HV(2:end,:)))...
        +(0.5.*(F3(1:end-1,:)+F3(2:end,:)));
    
    G1h=(m.*(H(:,1:end-1)-H(:,2:end)))...
        +(0.5.*(G1(:,1:end-1)+G1(:,2:end)));
    G2h=(m.*(HU(:,1:end-1)-HU(:,2:end)))...
        +(0.5.*(G2(:,1:end-1)+G2(:,2:end)));
    G3h=(m.*(HV(:,1:end-1)-HV(:,2:end,:)))...
        +(0.5.*(G3(:,1:end-1)+G3(:,2:end)));
    
   
    %!! Bodeterm nachtragen
    
    %4) Erhaltungsschema
    %TODO erklären was wir da machen
    H(2:end-1,2:end-1)=H(2:end-1,2:end-1)...
        -((dt./dx).*(F1h(2:end,2:end-1)-F1h(1:end-1,2:end-1)))...
        -((dt./dy).*(G1h(2:end-1,2:end)-G1h(2:end-1,1:end-1)));
    HU(2:end-1,2:end-1)=HU(2:end-1,2:end-1)...
        -((dt./dx).*(F2h(2:end,2:end-1)-F2h(1:end-1,2:end-1)))...
        -((dt./dy).*(G2h(2:end-1,2:end)-G2h(2:end-1,1:end-1)));
    HV(2:end-1,2:end-1)=HV(2:end-1,2:end-1)...
        -((dt./dx).*(F3h(2:end,2:end-1)-F3h(1:end-1,2:end-1)))...
        -((dt./dy).*(G3h(2:end-1,2:end)-G3h(2:end-1,1:end-1)));
    
    
%     %5) Randbedingungen (absobierend)
%     H(1,:)=H(2,:);
%     H(end,:)=H(end-1,:);
%     HU(1,:)=HU(2,:);
%     HU(end,:)=HU(end-1,:);
%     HV(1,:)=HV(2,:);
%     HV(end,:)=HV(end-1,:);
%     
%     H(:,1)=H(:,2);
%     H(:,end)=H(:,end-1);
%     HU(:,1)=HU(:,2);
%     HU(:,end)=HU(:,end-1);
%     HV(:,1)=HV(:,2);
%     HV(:,end)=HV(:,end-1);

    %5) Randbedingungen (reflektierend)
    H(1,:)=H(2,:);
    H(end,:)=H(end-1,:);
    HU(1,:)=-HU(2,:);
    HU(end,:)=-HU(end-1,:);
    HV(1,:)=-HV(2,:);
    HV(end,:)=-HV(end-1,:);
    
    H(:,1)=H(:,2);
    H(:,end)=H(:,end-1);
    HU(:,1)=-HU(:,2);
    HU(:,end)=-HU(:,end-1);
    HV(:,1)=-HV(:,2);
    HV(:,end)=-HV(:,end-1);
    
    t=t+dt;
    n=n+1;
end
