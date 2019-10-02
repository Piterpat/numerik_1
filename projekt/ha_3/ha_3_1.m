%numerischer loeser einer eindimensionalen 
%Erhaltungsgleichung mithilfe des
%Erhaltungsschemas
clear

ha_3_1_set
ha_3_1_karte
ha_3_1_bodenterm
ha_3_1_schadstoffset
ha_3_1_plotset

tic

while t<e

    
    %0) Plotten
    if plotart ~= 0
        if plotart == 1
            if ~ishghandle(fig)
                break
            end
            ha_3_1_plot 
        elseif plotart == 2
            if t >= next_frame
                if ~ishghandle(fig)
                    break
                end
                ha_3_1_plot
                next_frame = next_frame + frame_int;
                t

            end
        end
    end
    
    
    %1) CFL Bedingung/Vorfaktor
    a=max([max(abs(HU./H)+abs(sqrt(g.*H+(HU./H).^2))),...
    max(abs(HV./H)+abs(sqrt(g.*H+(HV./H).^2)))]);
    dt=CFL.*(min([dx,dy])./a);
    
    if verfahren == 0
        vff=dx./(4.*dt);
        vfg=dx./(4.*dt);
    elseif verfahren == 1
        vff=0.25.*((abs(HU./H)+abs(sqrt(g.*H+(HU./H).^2))));
        vfg=0.25.*((abs(HV./H)+abs(sqrt(g.*H+(HV./H).^2))));
        vff=vff(1:end-1,:);
        vfg=vfg(:,1:end-1);
    else
        error('Ungueltiges Verfahren ausgewaehlt (In ha_3_1_set aendern)')
    end

    
    %2) Flussgroessen Zellmittelpunkt
    F1=HU;
    F2=(((HU).^2)./H)+(0.5.*g.*(H.^2));
    F3=HU.*(HV./H);
    
    G1=HV;
    G2=HU.*(HV./H);
    G3=(((HV).^2)./H)+(0.5.*g.*(H.^2));
    
    %3) Approximation der Flussgroessen
    F1h(1:end-1,:)=(vff.*(H(1:end-1,:)-H(2:end,:)))...
        +(0.5.*(F1(1:end-1,:)+F1(2:end,:)));
    F2h(1:end-1,:)=(vff.*(HU(1:end-1,:)-HU(2:end,:)))...
        +(0.5.*(F2(1:end-1,:)+F2(2:end,:)));
    F3h(1:end-1,:)=(vff.*(HV(1:end-1,:)-HV(2:end,:)))...
        +(0.5.*(F3(1:end-1,:)+F3(2:end,:)));
    
    G1h(:,1:end-1)=(vfg.*(H(:,1:end-1)-H(:,2:end)))...
        +(0.5.*(G1(:,1:end-1)+G1(:,2:end)));
    G2h(:,1:end-1)=(vfg.*(HU(:,1:end-1)-HU(:,2:end)))...
        +(0.5.*(G2(:,1:end-1)+G2(:,2:end)));
    G3h(:,1:end-1)=(vfg.*(HV(:,1:end-1)-HV(:,2:end,:)))...
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
    
    %5) Schadstoff
    if schadstoffart ~= 0
        U=HU./H;
        
        Axp=(U+abs(U))./2;
        Axn=(U-abs(U))./2;
        Cxp=Axp.*(dt./dx);
        Cxn=Axn.*(dt./dx);
        
        V=HV./H;
        
        Ayp=(V+abs(V))./2;
        Ayn=(V-abs(V))./2;
        Cyp=Ayp.*(dt./dy);
        Cyn=Ayn.*(dt./dy);
        

        Sx(2:end-1,:)=S(2:end-1,:)...
            -Cxp(2:end-1,:).*(S(2:end-1,:)-S(1:end-2,:))...
            -Cxn(2:end-1,:).*(S(3:end,:)-S(2:end-1,:));

        Sy(:,2:end-1)=S(:,2:end-1)...
            -Cyp(:,2:end-1).*(S(:,2:end-1)-S(:,1:end-2))...
            -Cyn(:,2:end-1).*(S(:,3:end)-S(:,2:end-1));

%             S=(Sx+Sy)./2;
        S=(Sx-S)+(Sy-S)+S;
    end
    %*) Timing-based-szenario-actions
    ha_3_1_timing

    %6) Randbedingung
    randbedingung

    t=t+dt;
    counter=counter+1;
end

toc

if videoart ~= 0
    close(v)
end
