if schadstoffart ~= 0
    % 0 - kein Schadstoff
    % 1 - Zentrierter Euler
    % 2 - Flussanfang
    % 3 - Diffusionstest
    % 4 - Schadstoff Becken (zu Flussdammbruch)
    % 5 - Leck am Boot (unendliche Quelle)
    % 6 - Haus im Tsunami
    % 7 - Dammbruch der 3.
    
    S=zeros(n,m);
    Sx=zeros(n,m);
    Sy=zeros(n,m);
    
    for i=1:n
        for ii=1:m

            if schadstoffart == 1
                S(i,ii)=1.*exp(-10.*((sqrt(x(i).^2+y(ii).^2)).^2))+0.6;
            end
            
            if schadstoffart == 2
                S(i,ii)=1.*exp(-10.*((sqrt((x(i)-0).^2+(y(ii)+0.7).^2)).^2))+0.6;
            end
            
            if schadstoffart == 3
                if i == 70 && ii == 15
                    S(i,ii)=1;
                end
            end
            
            if schadstoffart == 4
                if x(i) < 0.6
                     S(i,ii)=0;
                else
                     S(i,ii)=1;
                end
            end
            
            if schadstoffart == 5
                S(i,ii)=0;
            end
            
            if schadstoffart == 6
                if (y(ii)>0.25 && y(ii)<0.45) && (x(i)>0.4 && x(i)<0.6)
                    S(i,ii)=2;
                end
            end
            
            if schadstoffart == 7
                if x(i)>=0.5 && x(i)<=0.65 && y(ii)>=0.05 && y(ii)<=0.55
                    S(i,ii)=1;
                end
            end
            
        end
    end
end