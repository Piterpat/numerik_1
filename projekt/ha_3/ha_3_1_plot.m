%Plotten


if bodenflag == 1
    Hplot(BER)=H(BER)+B(BER);
    surf(x,y,Hplot)
    hold on
    surf(x,y,B)
    hold off
    axis(axis_set)
    xlabel('X')
    ylabel('Y')
else
    Hplot(BER)=H(BER);
    surf(x,y,Hplot)
    axis(axis_set)
    xlabel('X')
    ylabel('Y')
end

% 0 - top-down
% 1 - isometrisch
% 2 - seite x
% 3 - seite y
% 4 - seite xy

if viewart == 0
    view(0,90)
end

if viewart == 1
    view(45,45)
end

if viewart == 2
    view(0,0)
end

if viewart == 3
    view(90,0)
end

if viewart == 4
    view(45,0)
end


caxis(caxis_set)

% colorbar

drawnow