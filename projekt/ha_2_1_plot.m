if ~ishandle(fig)
    break
end
plot(x,H,'k')
axis([l,r,0,1])
Frames(n) = getframe(gcf);
drawnow