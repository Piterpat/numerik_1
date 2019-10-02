%Plotten
if schadstoffart~=0
        Splot(BER)=S(BER);
end

if bodenart~=0
    Hplot(BER)=H(BER)+B(BER);
else
    Hplot(BER)=H(BER);
end


if schadstoffart~=0
    
%     subplot(2,2,1)
%     surf(y,x,Hplot)
%     caxis(caxis_set_H)
%     shading interp
%     axis(axis_set_H)
%     axis equal
%     view(0,90)
% %     xlabel('Y')
% %     ylabel('X')
%     grid off
% %     set(gca,'visible','off')
    
%     subplot(2,2,2)
    surf(y,x,Splot)
    caxis(caxis_set_S)
    shading interp
    axis(axis_set_S)
    axis equal
    view(0,90)
%     xlabel('Y')
%     ylabel('X')
    grid off
%     set(gca,'visible','off')

%     
%     subplot(2,2,3)
%     surf(y,x,Hplot)
%     if bodenart ~= 0
%         hold on
%         mesh(y(1:griddiv:end),x(1:griddiv:end),Bplot(1:griddiv:end,1:griddiv:end))
%         hold off
%     end
%     caxis(caxis_set_H)
%     shading interp
% %     axis equal
%     axis(axis_set_H)
%     view(45,45)
%     grid off
% %     set(gca,'visible','off')
% 
% 
%     subplot(2,2,4)
%     surf(y,x,Splot)
%     caxis(caxis_set_S)
%     colormap jet
%     shading interp
% %     axis equal
%     axis(axis_set_S)
%     view(45,45)
%     grid off
% %     set(gca,'visible','off')

    
else
    surf(y,x,Hplot)
    if bodenart ~= 0
        hold on
        surf(y,x,Bplot)
        hold off
    end

    axis(axis_set_H)
    xlabel('X')
    ylabel('Y')
    zlabel('H')

    axis equal
    % grid off

    %fancy shit
    % colormap cool
    % shading interp
    % set(gca,'visible','off')

    caxis(caxis_set_H)

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
end

drawnow

if videoart ~= 0
    writeVideo(v,getframe(ax))
end