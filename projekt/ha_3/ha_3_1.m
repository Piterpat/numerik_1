%numerischer loeser einer eindimensionalen 
%Erhaltungsgleichung mithilfe des
%Erhaltungsschemas
ha_3_1_set
ha_3_1_karte
ha_3_1_bodenterm
ha_3_1_plotset

while t<e

    %0) Plotten
    if ~ishghandle(fig)
        break
    end
    ha_3_1_plot
    
    
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
    
    
    %4) Erhaltungsschema
    if bodenart ~= 0
        HU(BER)=HU(BER)...
            -((dt./dx).*(F2h(BER)-F2h(BERr)))...
            -((dt./dy).*(G2h(BER)-G2h(BERu)))...
            -(dt.*(g.*H(BER).*dBx(BER)));
        HV(BER)=HV(BER)...
            -((dt./dx).*(F3h(BER)-F3h(BERr)))...
            -((dt./dy).*(G3h(BER)-G3h(BERu)))...
            -(dt.*(g.*H(BER).*dBy(BER)));
    else
        HU(BER)=HU(BER)...
            -((dt./dx).*(F2h(BER)-F2h(BERr)))...
            -((dt./dy).*(G2h(BER)-G2h(BERu)));
        HV(BER)=HV(BER)...
            -((dt./dx).*(F3h(BER)-F3h(BERr)))...
            -((dt./dy).*(G3h(BER)-G3h(BERu)));
    end
    
    H(BER)=H(BER)...
        -((dt./dx).*(F1h(BER)-F1h(BERr)))...
        -((dt./dy).*(G1h(BER)-G1h(BERu)));
    

      %5) Randbedingung
      randbedingung

    t=t+dt;
    n=n+1;
end

ha_3_1_videoout 
