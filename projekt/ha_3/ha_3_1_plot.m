%Plotten

if bodenart ~= 0
    Hplot(BER)=H(BER)+B(BER);
    surf(x,y,Hplot)
    hold on
    surf(x,y,B)
    hold off
else
    Hplot(BER)=H(BER);
    surf(x,y,Hplot)
end

axis(axis_set)
% xlabel('X')
% ylabel('Y')
% zlabel('H')

axis square
grid off

caxis(caxis_set)

% 0 - top-down
% 1 - isometrisch
% 2 - seite x
% 3 - seite y
% 4 - seite xy
% 5 - seite y zu ismoetrisch 2
% 6 - isometrisch 2
% 7 - 45 grad y

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

if viewart == 5
    %view(90,0) zu view (45,45) in p schritten
    if n > d
        view(((45/(p-d))*(n-d))+90,(45/(p-d))*(n-d))
    else
        view(90,0)
    end
    
end

if viewart == 6
    view(135,45)
end

if viewart == 7
    view(90,45)
end



% colorbar

drawnow

if videoart ~= 0
    Frames(n) = getframe(gcf);
end