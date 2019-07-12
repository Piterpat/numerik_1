%Plotten

% 0 - top-down
% 1 - isometrisch


Hplot(BER)=H(BER);
surf(x,y,Hplot)
hold on
surf(x,y,B)
hold off
axis(axis_set)

if viewart == 0
    view(0,90)
end

if viewart == 1
    view(45,45)
end

caxis(caxis_set)

% colorbar

drawnow