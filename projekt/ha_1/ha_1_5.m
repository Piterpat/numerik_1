% ha_1_5 implementiert ein implizites Lösungsverfahren (FTCS)

a=1;
f=@(x) exp(-(5./2).*(x-2).^2);
% f=@(x) ha_1_2_g(x);


%Intervall Grenzen
% delta x
l=0;
r=10;
N=100;
deltax=(r-l)./N;

x=linspace(l,r,N)';
% delta t
s=0;
e=5;

deltat=0.45;
M = floor((e-s)./deltat);

c=(a .* deltat) ./ deltax;
% Matrizen erstellen
FTCS=zeros(N,M);
L=zeros(N,M);
D = zeros(N,N);
% D Matrize für implizites Verfahren
for i=1:N-1
    D(i+1,i)=1;
    D(i,i+1)=-1;
end

FTCS(2:end-1,1)=f(x(2:end-1,1));
I=eye(N,N);
tic
for i=2:M
    FTCS(1:N,i)= (I-((c./2).*D)) \ FTCS(1:N,i-1);
    FTCS(1,i) = 0;
    FTCS(N,i) = 0;
end
timp = toc;



% %analytische Loesung
% for i=1:M
%     L(2:end-1,i)=f(x(2:end-1,1)-((i-1)*deltat));
% end
% 
% 
%     plot(x,L(1:end,10),'k');
%     hold on
%     plot(x,FTCS(1:end,10),'g');
%     legend('analyitsche','FTCS')
%     axis([l,r,min(FTCS(:,1)),max(FTCS(:,1))])
% hold off
    

%     Frames=struct('cdata', cell(1, M), 'colormap', cell(1, M));
% fig=figure(1);
% for i=1:M
%     if ~ishandle(fig)
%         break
%     end
%     plot(x,L(:,i),'k')
%     hold on
%     plot(x,FTCS(:,i),'b')
% %     plot(x,F(:,i),'g')
% %     plot(x,W(:,i),'r')
%     hold off
%     legend('analyitsche','FTCS')
%     axis([l,r,min(FTCS(:,1)),max(FTCS(:,1))])
%     Frames(i) = getframe(gcf);
%     drawnow
% end

% % create the video writer with 1 fps
%   writerObj = VideoWriter('ha_1_5_projekt.avi');
%   writerObj.FrameRate = 10;
%   % set the seconds per image
% % open the video writer
% open(writerObj);
% % write the frames to the video
% for i=1:length(Frames)
%     % convert the image to a frame
%     frame = Frames(i) ;    
%     writeVideo(writerObj, frame);
% end
% % close the writer object
% close(writerObj);