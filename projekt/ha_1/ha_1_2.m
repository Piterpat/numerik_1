%Hausaufgabe 1.2 implemtieren des Upwind-Verfahrens
%LÃ¶sen der linearen Transportgleichung auf gegebenen Gebiet
function [L,U,W,deltax] = ha_1_2 (N)

a=1;
CFL=0.9;

  f=@(x) exp(-(5./2).*(x-2).^2);
%  f=@(x) ha_1_2_g(x);

%Intervall Grenzen
l=0;
r=10;
% N=256;
deltax=(r-l)./N;

s=0;
e=5;
deltat=(deltax./a).*CFL;
M=floor((e-s)/deltat);

x=linspace(l,10,N)';

L=zeros(N,M);
U=zeros(N,M);
F=zeros(N,M);
W=zeros(N,M);

%analytische Loesung
for i=1:M
    L(2:end-1,i)=f(x(2:end-1)-((i-1)*deltat));
end

%Upwind
U(2:end-1,1)=f(x(2:end-1,1));

i=1;
tic;
while i<=M-1
    U(2:end-1,i+1)=U(2:end-1,i)-CFL.*(U(2:end-1,i)-U(1:end-2,i));
    i=i+1;
end
tu= toc;
% Lax-Friedrich
F(2:end-1,1)=f(x(2:end-1,1));

i=1;
tic;
while i<=M-1
    F(2:end-1,i+1)=0.5.*(F(3:end,i)+F(1:end-2,i))-0.5.*CFL.*(F(3:end,i)-F(1:end-2,i));
    i=i+1;
end
tf= toc;
%Lax-Wendroff
W(2:end-1,1)=f(x(2:end-1,1));

i=1;
tic
while i<=M-1
    W(2:end-1,i+1)=W(2:end-1,i)-0.5.*CFL.*(W(3:end,i)-W(1:end-2,i))+0.5.*(CFL^2).*(W(3:end,i)-2.*W(2:end-1,i)+W(1:end-2,i));
    i=i+1;
end
tw = toc;




% ha_1_5

%     plot(x,L(:,27),'k')
%     hold on
%     plot(x,U(:,27),'b')
%     plot(x,F(:,27),'g')
%     plot(x,W(:,27),'r')
%     plot(x,FTCS(1:end,27),'m');
%     hold off
%     legend('analyitsche','Upwind','Lax-Friedrich','Lax-Wendroff','FTCS')
%     axis([l,r,min(U(:,1)),max(U(:,1))])
    
% Zeiten für Erstellung
%     tu
%     tf
%     tw
%     timp
    

% plotting
% Frames=struct('cdata', cell(1, M), 'colormap', cell(1, M));
% fig=figure(1);
% for i=1:M
% %     if ~ishandle(fig)
% %         break
% %     end
%     plot(x,L(:,i),'k')
%     hold on
%     plot(x,U(:,i),'b')
%     plot(x,F(:,i),'g')
%     plot(x,W(:,i),'r')
% %     plot(x,FTCS(1:end,i),'m');
%     hold off
%     legend('analytsche','Upwind','Lax-Friedrich','Lax-Wendroff')
%     axis([l,r,min(U(:,1)),max(U(:,1))])
% %     Frames(i) = getframe(gcf);
%     drawnow
% end
% 
% % create the video writer with 1 fps
%   writerObj = VideoWriter('ha_1_2_projekt.avi');
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
