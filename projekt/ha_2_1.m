%numerischer löser einer eindimensionalen Erhaltungsgleichung mithilfe des
%Erhaltungsschemas
clear

g=9.81;



CFL=1;
a=1;
f=@(x) ha_2_1_g(x);
dB=0;

l=0;
r=1;
N=100;
dx=(r-l)./N;

s=0;
e=70;
dt=CFL.*(dx./a);
T=floor((e-s)./dt);

H=zeros(N,T);
HU=zeros(N,T);
F2=zeros(N,T);
F1h=zeros(N-1,T);
F2h=zeros(N-1,T);

x=linspace(l,r,N)';
H(:,1)=f(x(:,1));

n=1;
while n<T
    
    %Randbedingungen
    H(1,n)=  H(2,n);
    HU(1,n)=  HU(2,n);
    H(end,n)=  H(end-1,n);
    HU(end,n)=  HU(end-1,n);
    
    for i=1:N
        F2(i,n)=((HU(i,n).^2)./H(i,n))+(0.5.*g.*(H(i,n).^2));
    end
    
    %Lax-Friedrich Flussfunktion
    F1h(:,n)=((dx./(2.*dt)).*(H(1:end-1,n)-H(2:end,n)))...
        +(0.5.*(HU(1:end-1,n)-HU(2:end,n)));
    
    F2h(:,n)=(((dx./dt).*0.5).*(HU(1:end-1,n)-HU(2:end,n)))...
        +(0.5.*(F2(1:end-1,n)-F2(2:end,n)));
    
    %Erhaltungsschema
    %Gleichung 1
    H(2:end-1,n+1)=H(2:end-1,n)...
        -((dt./dx).*(F1h(2:end,n)-F1h(1:end-1,n)));
    
    %Gleichung 2
    HU(2:end-1,n+1)=HU(2:end-1,n)...
       -((dt./dx).*(F2h(2:end,n)-F2h(1:end-1,n)));

    n=n+1;
end

%plotting
Frames=struct('cdata', cell(1, N), 'colormap', cell(1, N));
fig=figure(1);
for i=1:T
    if ~ishandle(fig)
        break
    end
    plot(x,H(:,i),'k')
    axis([l,r,min(H(:,1)),max(H(:,1))])
    Frames(i) = getframe(gcf);
    drawnow
end


% create the video writer with 1 fps
  writerObj = VideoWriter('ha_2_1_projekt.avi');
  writerObj.FrameRate = 30;
  % set the seconds per image
% open the video writer
open(writerObj);
% write the frames to the video
for i=1:length(Frames)
    % convert the image to a frame
    frame = Frames(i) ;    
    writeVideo(writerObj, frame);
end
% close the writer object
close(writerObj);
