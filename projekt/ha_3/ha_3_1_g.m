function [z]=ha_3_1_g(x,y,anfangsbedingung)
% 0 - Wassertropfen
% 1 - Welle nach innen
% 2 - Sinusbecken
% 3 - Dammbruch
% 4 - Flach
% 5 - Validierung

    [n,~]=size(x);
    [m,~]=size(y);
    z=zeros(n,m);
    for i=1:n
        for ii=1:m
            if anfangsbedingung == 0
                 if ((x(i)^2)+(y(ii)^2)) <= 0.1
                     z(i,ii)=7;
                 else
                     z(i,ii)=4;
                 end
            end
            
            if anfangsbedingung == 1
               if sqrt(x(i).*y(ii)) <= 0.5
                   z(i,ii)=6;
               else
                   z(i,ii)=3+sqrt(x(i).*y(ii)).*3;
               end
            end
            
            if anfangsbedingung == 2
                z(i,ii)=(sin(5.*x(i)).*sin(5.*y(ii)))+5;
            end

            if anfangsbedingung == 3
                if i < 80
                     z(i,ii)=4;
                else
                     z(i,ii)=10;
                end
            end
            
            if anfangsbedingung == 4
                z(i,ii)=5;
            end
            
            if anfangsbedingung == 5
                if i < n/2
                     z(i,ii)=1;
                else
                     z(i,ii)=0.5;
                end
            end
            
        end
    end
end