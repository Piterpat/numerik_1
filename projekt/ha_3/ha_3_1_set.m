clear
g=9.81;

CFL=(1./sqrt(2))-0.05;


%aufloesung
n=100;
m=100;




kartenart = 8;
% 0 - nur Rand
% 1 - Dammbruch Spalt
% 2 - Pylon
% 3 - Viertel
% 4 - Doppelspalt
% 5 - Wellenbrecher Pfeiler
% 6 - doppel saeulen 300
% 7 - Wellenbecken
% 8 - Fluss

    kartenrand = 0;
    % 0 - absorbierend
    % 1 - reflektierend

    abs_ref = 2;
    % 1 - Innere Zellen der Karte absorbierend
    % 2 - Innere Zellen der Karte reflektierend
    % 3 - dirilet Randbedingung Anregung

    dirit = 2;
    % 1 - kleine Welle
    % 2 - groﬂe Welle
    % 3 - riesige Welle
    % 4 - Einflieﬂen
%     Impuls angeben
imp = 10;

anfangsbedingung = 7;
% 0 - Wassertropfen
% 1 - Welle nach innen
% 2 - Sinusbecken
% 3 - Dammbruch
% 4 - Flach
% 5 - Validierung
% 6 - welle 1/5
% 7 - Flussdammbruch

bodenart = 0;
% 0 - kein Boden
% 1 - Wellenboden
% 2 - Schraege
% 3 - Stufe
% 4 - Flach
% 5 - Kuppel

schadstoffart = 2;
% 0 - kein Schadstoff
% 1 - Zentrierter euler
% 2 - Flussanfang

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

realtime = 0;
% 0 - Frame pro Rechenschritt
% 1 - Frame pro Zeitintervall
    next_frame = 0; % First Frame
    frame_int = 0.1;


videoart = 0;
% 0 - kein Video
% 1 - Video (wie geplottet)

    videoname = "ha_3_1_video";
    
%Start und Ende (Zeit)
s=0;
e=1;


%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=-1;
r=1;
u=-1;
o=1;



