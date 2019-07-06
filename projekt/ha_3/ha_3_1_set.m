clear

g=9.81;

CFL=(1./sqrt(2))-0.05;

dB=0;

%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=-1;
r=1;
u=-1;
o=1;

%Anzahl der Schritte N fuer x M fuer y
N=100;
M=100;
dx=(r-l)./N;
dy=(o-u)./M;

%Start und Ende (Zeit)
s=0;
e=1;

x=linspace(l,r,N)';
y=linspace(u,o,M)';

%U fuer 3D (mit gegebenen Anfangsvektor fuer H)
H=ha_3_1_g(x,y);
HU=zeros(N,M);
HV=zeros(N,M);

%F fuer 3D
F1=zeros(N,M);
F2=zeros(N,M);
F3=zeros(N,M);

%G fuer 3D
G1=zeros(N,M);
G2=zeros(N,M);
G3=zeros(N,M);

%F halbe 
F1h=zeros(N-1,M-1);
F2h=zeros(N-1,M-1);
F3h=zeros(N-1,M-1);

%G halbe 
G1h=zeros(N-1,M-1);
G2h=zeros(N-1,M-1);
G3h=zeros(N-1,M-1);

%Laufvariable der while schleife (fuer Indizes der Vektoren)
n=1;
%Endbedingung der while schleife
t=s;

% plotten

fig=figure(1);
axis_set=[min(x) max(x)...
        min(y) max(x)...
        min(min(H))-1 max(max(H))+1];
caxis_set=[min(min(H)) max(max(H))];