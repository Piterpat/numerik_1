if schadstoffart ~= 0
    % 0 - kein Schadstoff
    % 1 - Zentrierter Euler
    S=zeros(N,M);
    Sx=zeros(N,M);
    Sy=zeros(N,M);
    
    for i=1:M
        for ii=1:N

            if schadstoffart == 1
%                 S(i,ii)=1;
                S(i,ii)=1.*exp(-10.*((sqrt(x(i).^2+y(ii).^2)).^2))+0.6;
            end
        end
    end
end