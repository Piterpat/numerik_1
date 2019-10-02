if schadstoffart == 5
    if t > 0.5
        for i = 1:n
            for ii= 1:m
                if x(i) >= 0.4 && x(i) <= 0.6 && y(ii) >= 0.45 && y(ii) <= 0.5
                    S(i,ii)=1;
                end
            end
        end
 
        if t < 1.55
            caxis_set_S=[min(min(S)-0.01) max(max(S))+0.01];
        end
        caxis_set_H=[min(min(H)-0.01) max(max(H))+0.01];
        axis_set_H=[ymin ymax...
            xmin xmax...
            min(min(H)-2) max(max(H))+2];
    end
end

if schadstoffart == 6
    if t > 0.1
        for i = 1:n
            for ii= 1:m
                if x(i) >= 0.45 && x(i) <= 0.55 && y(ii) >= 0.3 && y(ii) <= 0.4
                    S(i,ii)=1;
                end
            end
        end
 
        if t < 1.55
            caxis_set_S=[min(min(S)-0.01) max(max(S))+0.01];
        end
        caxis_set_H=[min(min(H)-0.01) max(max(H))+0.01];
        axis_set_H=[ymin ymax...
            xmin xmax...
            min(min(H)-2) max(max(H))+2];
    end
end

if kartenart == 10
    if counter == 500
        ha_3_1_plotset
    end
end