if schadstoffart ~= 0
    % 0 - kein Schadstoff
    % 1 - Zentrierter Euler
    % 2 - Flussanfang
    
    S=zeros(N,M);
    Sx=zeros(N,M);
    Sy=zeros(N,M);
    
    for i=1:M
        for ii=1:N

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
        
        end
    end
end