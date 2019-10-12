%karten erstellen
randkarte = zeros(n,m);

x=linspace(xmin,xmax,n)';
y=linspace(ymin,ymax,m)';

% 0 - nur Rand
% 1 - Dammbruch Spalt
% 2 - Pylon
% 3 - Viertel
% 4 - Doppelspalt
% 5 - Wellenbrecher Pfeiler
% 6 - doppel saeulen
% 7 - Wellenbecken
% 8 - Fluss
% 9 - Boot auf Meer (0,10,0,20,relativ)
% 10 - Haeuser bei Tsunami
% 11 - Dammbruch der 3.

for i=1:n
    for ii=1:m

        %------------------------------------------------
        if i==1 || i==n || ii==1 || ii==m
            if kartenrand == 0
                randkarte(i,ii)=1;
            end
            if kartenrand == 1
                randkarte(i,ii)=2;
            end
        end
        %------------------------------------------------
        
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
        
        if kartenart == 6
            if (x(i)+0.5)^2+(y(ii)+0.4)^2<0.02
                    randkarte(i,ii)=abs_ref;
            end
            if (x(i)+0.5)^2 +(y(ii)-0.4)^2<0.02
                    randkarte(i,ii)=abs_ref;
            end
        end
                
        if kartenart == 7
            if i == n
                randkarte(i,ii) = 3;
            end
            if i < 80 && i > 70
                if (ii > 0 && ii < 30) ||(ii > 40 && ii < 60) || (ii > 70 && ii < 100)
                    randkarte(i,ii)=abs_ref;
                end
            end
        end
        
        if kartenart == 8
            
            randkarte(i,ii)=2;

            if (y(ii)>-0.9 && y(ii)<-0.5) && x(i)>-0.9
                randkarte(i,ii)=0;
            elseif (x(i)>-0.9 && x(i)<-0.5) && y(ii)>-0.9 && y(ii)<0.4
                randkarte(i,ii)=0;
            elseif (y(ii)>0 && y(ii)<0.4) && x(i)>-0.9 && x(i)<0.4
                randkarte(i,ii)=0;
            elseif (x(i)>0 && x(i)<0.4) && y(ii)>0
                randkarte(i,ii)=0;
            elseif (y(ii)>-0.9 && y(ii)<0.9) && x(i)>0.6
                randkarte(i,ii)=0;
            end
            
            if i==1 || ii==1 || ii==m
                randkarte(i,ii) = 1;
            end
            
            if i == n
                randkarte(i,ii) = 2;
            end
        end
        
        if kartenart == 9
            
            %Bootskasten
            if (y(ii)>0.5 && y(ii)<0.8) && (x(i)>0.35 && x(i)<0.75)
                randkarte(i,ii)=2;
            elseif (y(ii)>0.5 && y(ii)<0.65) && (x(i)>0.2 && x(i)<0.35) && (y(ii) + x(i) >  0.85)
                randkarte(i,ii)=2;
            elseif (y(ii)>0.65 && y(ii)<0.8) && (x(i)>0.2 && x(i)<0.35) && (y(ii) - x(i) <  0.45)
                randkarte(i,ii)=2;
            end
            
            if i==1 || i==n || ii==m
                randkarte(i,ii) = 1;
            end
            
            if ii == 1
                randkarte(i,ii) = 3;
            end
        end
        
        if kartenart == 10
            if (y(ii)>0.7 && y(ii)<1.05) && (x(i)>0.2 && x(i)<0.35)
                randkarte(i,ii)=2;
            elseif (y(ii)>0.85 && y(ii)<1.1) && (x(i)>0.5 && x(i)<0.8)
                randkarte(i,ii)=2;
            elseif (y(ii)>1.3 && y(ii)<1.4) && (x(i)>0.6 && x(i)<0.7)
                randkarte(i,ii)=2;
            elseif (y(ii)>1.4 && y(ii)<1.65) && (x(i)>0.8 && x(i)<0.95)
                randkarte(i,ii)=2;
            elseif (y(ii)>1.35 && y(ii)<1.5) && (x(i)>0.1 && x(i)<0.35)
                randkarte(i,ii)=2;        
            elseif (y(ii)>1.5 && y(ii)<1.6) && (x(i)>0.1 && x(i)<0.25)
                randkarte(i,ii)=2;
            elseif (y(ii)>1.6 && y(ii)<1.75) && (x(i)>0.1 && x(i)<0.35)
                randkarte(i,ii)=2;
            elseif (y(ii)>1.65 && y(ii)<1.85) && (x(i)>0.45 && x(i)<0.65) && (y(ii) > x(i) + 1.2)
                randkarte(i,ii)=2;
            end

            if i==1 || i==n  || ii==m
                randkarte(i,ii) = 1;
            end
            
            if ii == 1
                randkarte(i,ii) = 3;
            end
        end
        
        if kartenart == 11
            randkarte(i,ii)=2;
            
            %Rechtecke
            if x(i)>=0.5 && x(i)<=0.95 && y(ii)>=0.05 && y(ii)<=0.55
                randkarte(i,ii)=0;
            elseif x(i)>=0.35 && x(i)<=0.5 && y(ii)>=0.15 && y(ii)<=0.45
                randkarte(i,ii)=0;
            elseif x(i)>=0.05 && x(i)<=0.35 && y(ii)>=0.45 && y(ii)<=1
                randkarte(i,ii)=0;
            elseif x(i)>=0.35 && x(i)<=0.55 && y(ii)>=1 && y(ii)<=1.3
                randkarte(i,ii)=0;
            elseif x(i)>=0.55 && x(i)<=0.85 && y(ii)>=1.3
                randkarte(i,ii)=0;
            end
            
            %Rundungen
            if (x(i)-0.35)^2 + (y(ii)-0.45)^2 <= 0.09 && x(i)<=0.35 && y(ii)<=0.45
                randkarte(i,ii)=0;
            end
            if (x(i)-0.35)^2 + (y(ii)-1)^2 <= 0.09 && x(i)<=0.35 && y(ii)>=1
                randkarte(i,ii)=0;
            end
            if (x(i)-0.55)^2 + (y(ii)-1.3)^2 <= 0.09 && x(i)>=0.55 && y(ii)<=1.3
                randkarte(i,ii)=0;
            end
            
            %Raender
            if i==1 || i==n || ii==1 || ii==m
                randkarte(i,ii)=1;
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
[diri_Ind1_r,diri_Ind1,diri_Ind2_r,...
    diri_Ind2x,diri_Ind2y,diri_Ind3_r,...
    diri_Ind3,diri_Ind4_r,diri_Ind4x,...
    diri_Ind4y,diri_Ind5_r,diri_Ind5,...
    diri_Ind6_r,diri_Ind6x,diri_Ind6y,...
    diri_Ind7_r,diri_Ind7,diri_Ind8_r,...
    diri_Ind8x,diri_Ind8y] = karte_diri(randkarte);


%Anzahl der Schritte N fuer x M fuer y
dx=(xmax-xmin)./n;
dy=(ymax-ymin)./m;

%U fuer 3D (mit gegebenen Anfangsvektor fuer H)
H=ha_3_1_g(x,y,anfangsbedingung);
HU=zeros(n,m);
HV=zeros(n,m);


%F halbe 
F1h=zeros(n,m);
F2h=zeros(n,m);
F3h=zeros(n,m);

%G halbe 
G1h=zeros(n,m);
G2h=zeros(n,m);
G3h=zeros(n,m);

%Laufvariable der while schleife (fuer Indizes der Vektoren)
counter=1;
%Endbedingung der while schleife
t=s;