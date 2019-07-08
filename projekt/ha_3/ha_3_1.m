%numerischer l�ser einer eindimensionalen 
%Erhaltungsgleichung mithilfe des
%Erhaltungsschemas
ha_3_1_set
ha_3_1_bodenterm

while t<e

    
    %0) Plotten
    if ~ishghandle(fig)
        break
    end
    Hplot(BER)=H(BER);
    surf(x,y,Hplot)
    hold on
    %surf(x,y,B)
    hold off
    axis(axis_set)
    view(0,90)
%     view(45,45)
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
    
    %3) Approximation der Flussgroessen
    %an den Zellwaenden
    vf=dx./(4.*dt);
    F1h(1:end-1,:)=(vf.*(H(1:end-1,:)-H(2:end,:)))...
        +(0.5.*(F1(1:end-1,:)+F1(2:end,:)));
    F2h(1:end-1,:)=(vf.*(HU(1:end-1,:)-HU(2:end,:)))...
        +(0.5.*(F2(1:end-1,:)+F2(2:end,:)));
    F3h(1:end-1,:)=(vf.*(HV(1:end-1,:)-HV(2:end,:)))...
        +(0.5.*(F3(1:end-1,:)+F3(2:end,:)));
    
    G1h(:,1:end-1)=(vf.*(H(:,1:end-1)-H(:,2:end)))...
        +(0.5.*(G1(:,1:end-1)+G1(:,2:end)));
    G2h(:,1:end-1)=(vf.*(HU(:,1:end-1)-HU(:,2:end)))...
        +(0.5.*(G2(:,1:end-1)+G2(:,2:end)));
    G3h(:,1:end-1)=(vf.*(HV(:,1:end-1)-HV(:,2:end,:)))...
        +(0.5.*(G3(:,1:end-1)+G3(:,2:end)));
    
   
    %!! Bodeterm nachtragen
    
    %4) Erhaltungsschema
    %TODO erkl�ren was wir da machen
    HU(BER)=HU(BER)...
        -((dt./dx).*(F2h(BER)-F2h(BERr)))...
        -((dt./dy).*(G2h(BER)-G2h(BERu)))...
        +0;
       % +(dt.*(g.*H(BER).*dBx(BER)));...
    HV(BER)=HV(BER)...
        -((dt./dx).*(F3h(BER)-F3h(BERr)))...
        -((dt./dy).*(G3h(BER)-G3h(BERu)))...
        +0;
      %  +(dt.*(g.*H(BER).*dBy(BER)));...
    H(BER)=H(BER)...
        -((dt./dx).*(F1h(BER)-F1h(BERr)))...
        -((dt./dy).*(G1h(BER)-G1h(BERu)));
    
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

      %5) Randbedingung
      randbedingung
    
%     %5) Randbedingungen (reflektierend)
%     H(1,:)=H(2,:);
%     H(end,:)=H(end-1,:);
%     HU(1,:)=-HU(2,:);
%     HU(end,:)=-HU(end-1,:);
%     HV(1,:)=-HV(2,:);
%     HV(end,:)=-HV(end-1,:);
%     
%     H(:,1)=H(:,2);
%     H(:,end)=H(:,end-1);
%     HU(:,1)=-HU(:,2);
%     HU(:,end)=-HU(:,end-1);
%     HV(:,1)=-HV(:,2);
%     HV(:,end)=-HV(:,end-1);
    
    t=t+dt;
    n=n+1;
end
