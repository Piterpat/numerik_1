clear

g=9.81;

CFL=(1./sqrt(2))-0.05;

dB=0;

%karten erstellen
n=100;
m=100;
randkarte = zeros(n,m);

for i=1:n
    for ii=1:m
        if i==1 || i==n || ii==1 || ii==m
            randkarte(i,ii)=1;
        end 
        if i < 80 && i > 70
            if ii < 30 || ii > 50
                randkarte(i,ii)=1;
            end
        end
    end
end

karteo=ones(n,m);
karteo(:,2:end)=randkarte(:,1:end-1);
karteu=ones(n,m);
karteu(:,1:end-1)=randkarte(:,2:end);
kartel=ones(n,m);
kartel(2:end,:)=randkarte(1:end-1,:);
karter=ones(n,m);
karter(1:end-1,:)=randkarte(2:end,:);


BER=find(~randkarte);
BERo=find(~karteo);
BERu=find(~karteu);
BERl=find(~kartel);
BERr=find(~karter);

[Ind1_r,Ind1,Ind2_r,Ind2x,...
    Ind2y,Ind3_r,Ind3,Ind4_r,Ind4x,...
    Ind4y,Ind5_r,Ind5,Ind6_r,Ind6x,...
    Ind6y,Ind7_r,Ind7,Ind8_r,Ind8x,...
    Ind8y] = karte(randkarte);
[r_Ind1_r,r_Ind1,r_Ind2_r,r_Ind2x,...
    r_Ind2y,r_Ind3_r,r_Ind3,r_Ind4_r,...
    r_Ind4x,r_Ind4y,r_Ind5_r,r_Ind5,...
    r_Ind6_r,r_Ind6x,r_Ind6y,r_Ind7_r,...
    r_Ind7,r_Ind8_r,r_Ind8x,r_Ind8y] = karte_ref(randkarte);
%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=-1;
r=1;
u=-1;
o=1;

%Anzahl der Schritte N fuer x M fuer y
[N,M]=size(randkarte);
dx=(r-l)./N;
dy=(o-u)./M;

%Start und Ende (Zeit)
s=0;
e=2;

x=linspace(l,r,N)';
y=linspace(u,o,M)';

%U fuer 3D (mit gegebenen Anfangsvektor fuer H)
H=ha_3_1_g(x,y);
HU=zeros(N,M);
HV=zeros(N,M);

% %F fuer 3D
% F1=zeros(N,M);
% F2=zeros(N,M);
% F3=zeros(N,M);
% 
% %G fuer 3D
% G1=zeros(N,M);
% G2=zeros(N,M);
% G3=zeros(N,M);

%F halbe 
F1h=zeros(N,M);
F2h=zeros(N,M);
F3h=zeros(N,M);

%G halbe 
G1h=zeros(N,M);
G2h=zeros(N,M);
G3h=zeros(N,M);

%Laufvariable der while schleife (fuer Indizes der Vektoren)
n=1;
%Endbedingung der while schleife
t=s;

%bodenterm
B=zeros(N,M);
for i=1:M
    for ii=1:N
%         B(i,ii)=sin(x(i).*pi);
%         B(i,ii)=(i+ii)/N;
        if x(i)<0
            B(i,ii)=0.5;
        else
            B(i,ii)=1;
        end
    end
end

% plotten
Hplot=zeros(N,M);
fig=figure(1);
axis_set=[min(x) max(x)...
        min(y) max(x)...
        min(min(H))-2 max(max(H))+2];
% axis_set=[min(x) max(x)...
%         min(y) max(x)...
%         2 8];
caxis_set=[min(min(H)) max(max(H))];