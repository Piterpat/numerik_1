clear
g=9.81;

CFL=(1./sqrt(2))-0.05;


%aufloesung
n=100;
m=100;

verfahren = 1;
% 0 - Lax-Friedrich
% 1 - Rusanov


kartenart = 9;
% 0 - nur Rand
% 1 - Dammbruch Spalt
% 2 - Pylon
% 3 - Viertel
% 4 - Doppelspalt
% 5 - Wellenbrecher Pfeiler
% 6 - doppel saeulen 300
% 7 - Wellenbecken
% 8 - Fluss
% 9 - Boot auf Meer (0,10,0,20,relativ)

    kartenrand = 1;
    % 0 - absorbierend
    % 1 - reflektierend

    abs_ref = 2;
    % 1 - Innere Zellen der Karte absorbierend
    % 2 - Innere Zellen der Karte reflektierend
    % 3 - dirilet Randbedingung Anregung

    dirit = 1;
    % 0 - kein dirit
    % 1 - x Seitig Höhe
    % 2 - x Seitig Impuls
    % 3 - y Seitig Höhe
    % 4 - y Seitig Impuls
        hei = 1;
            % 1 - Welle
        imp = 1;
            % 1 - Welle

anfangsbedingung = 4;
% 0 - Wassertropfen
% 1 - Welle nach innen
% 2 - Sinusbecken
% 3 - Dammbruch
% 4 - Flach
% 5 - Validierung
% 6 - welle 1/5
% 7 - Flussdammbruch
% 8 - projektaufgabe kasten

bodenart = 0;
% 0 - kein Boden
% 1 - Wellenboden
% 2 - Schraege
% 3 - Stufe
% 4 - Flach
% 5 - Kuppel
    griddiv = 5;

schadstoffart = 2;
% 0 - kein Schadstoff
% 1 - Zentrierter euler
% 2 - Flussanfang euler
% 3 - Diffusionstest
% 4 - Schadstoff Becken (zu Flussdammbruch)

viewart = 1;
% 0 - top-down
% 1 - isometrisch
% 2 - seite x
% 3 - seite y
% 4 - seite xy
% 5 - seite y zu ismoetrisch 2
    p = 229;
    d = 20;
% 6 - Isometrisch 2
% 7 - 45 grad y


plotart = 1;
% 0 - nicht plotten
% 1 - Frame pro Rechenschritt
% 2 - Frame pro Zeitintervall
    next_frame = 0; % First Frame
    frame_int = 0.1;


videoart = 0;
% 0 - kein Video
% 1 - Video (wie geplottet)

    videoname = "ha_3_1_video";
    
%Start und Ende (Zeit)
s=0;
e=10;


%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=0;
r=2;
u=0;
o=1;
