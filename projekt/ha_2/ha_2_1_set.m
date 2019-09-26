clear

g=9.81;

CFL=1;
dB=0;


l=-1;
r=1;
N=100;
dx=(r-l)./N;

s=0;
e=2;

x=linspace(l,r,N)';
H(:,1)=ha_2_1_g(x(:,1),N);
% H(:,1)=ones(N,1);

HU=zeros(N,1);
F1=zeros(N,1);
F2=zeros(N,1);
F1h=zeros(N-1,1);
F2h=zeros(N-1,1);

%transport
% S=zeros(N,1);
% S(floor(N/2),1)=1;
S=0.2.*exp(-10.*(x).^2)+0.6;


n=1;
t=s;

%fuer das video/plotten
up=max(H)+0.5;
low=min(H)-0.5;

Frames=struct('cdata', cell(1, N), 'colormap', cell(1, N));
fig=figure(1);