clear

g=9.81;

CFL=1;
f=@(x) ha_2_1_g(x);
dB=0;


l=-1;
r=1;
N=100;
dx=(r-l)./N;

s=0;
e=0.6;

x=linspace(l,r,N)';
H(:,1)=f(x(:,1));

HU=zeros(N,1);
F1=zeros(N,1);
F2=zeros(N,1);
F1h=zeros(N-1,1);
F2h=zeros(N-1,1);

n=1;
t=s;

%fuer das video/plotten
up=max(H)+0.5;
low=min(H)-0.5;

Frames=struct('cdata', cell(1, N), 'colormap', cell(1, N));
fig=figure(1);