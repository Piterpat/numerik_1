%karten erstellen
n=100;
m=100;
randkarte = zeros(n,m);

% 0 - nur Rand
% 1 - Dammbruch Spalt
% 2 - Pylon
% 3 - Viertel
% 4 - Doppelspalt
% 5 - Wellenbrecher Pfeiler

for i=1:n
    for ii=1:m

        if kartenart == 1
            if i < 80 && i > 70
                if ii < 30 || ii > 50
                    randkarte(i,ii)=abs_ref;
                end
            end
        end
        
        if kartenart == 2
            if i < 60 && i > 40
                if ii < 60 || ii > 40
                    randkarte(i,ii)=abs_ref;
                end
            end
        end
        
        if kartenart == 3
            if i < 100 && i > 50
                if ii < 50 || ii > 100
                    randkarte(i,ii)=abs_ref;
                end
            end
        end
        
        if kartenart == 4
            if i < 80 && i > 70
                if (ii > 0 && ii < 30) ||(ii > 40 && ii < 60) || (ii > 70 && ii < 100)
                    randkarte(i,ii)=abs_ref;
                end
            end
        end
        
        if kartenart == 5
            if i < 80 && i > 70
                if (ii > 10 && ii < 30) || (ii > 70 && ii < 90)
                    randkarte(i,ii)=abs_ref;
                end
            end
        end

        if i==1 || i==n || ii==1 || ii==m
            if kartenrand == 0
                randkarte(i,ii)=1;
            end
            if kartenrand == 1
                randkarte(i,ii)=2;
            end
        end
        
    end
end


karteu=ones(n,m);
karteu(:,1:end-1)=randkarte(:,2:end);
karter=ones(n,m);
karter(1:end-1,:)=randkarte(2:end,:);


BER=find(~randkarte);
BERu=find(~karteu);
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


%Anzahl der Schritte N fuer x M fuer y
[N,M]=size(randkarte);
dx=(r-l)./N;
dy=(o-u)./M;


x=linspace(l,r,N)';
y=linspace(u,o,M)';

%U fuer 3D (mit gegebenen Anfangsvektor fuer H)
H=ha_3_1_g(x,y,anfangsbedingung);
HU=zeros(N,M);
HV=zeros(N,M);


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