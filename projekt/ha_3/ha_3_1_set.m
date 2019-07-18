clear
g=9.81;

CFL=(1./sqrt(2))-0.05;

kartenrand = 1;
% 0 - absorbierend
% 1 - reflektierend

abs_ref = 2;
% 1 - Innere Zellen der Karte absorbierend
% 2 - Innere Zellen der Karte reflektierend

kartenart = 0;
% 0 - nur Rand
% 1 - Dammbruch Spalt
% 2 - Pylon
% 3 - Viertel
% 4 - Doppelspalt
% 5 - Wellenbrecher Pfeiler
% 6 - doppel saeulen 300

anfangsbedingung = 6;
% 0 - Wassertropfen
% 1 - Welle nach innen
% 2 - Sinusbecken
% 3 - Dammbruch
% 4 - Flach
% 5 - Validierung
% 6 - welle 1/5

bodenart = 2;
% 0 - kein Boden
% 1 - Wellenboden
% 2 - Schraege
% 3 - Stufe
% 4 - Flach
% 5 - Kuppel


viewart = 3;
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


videoart = 1;
% 0 - kein Video
% 1 - Video (wie geplottet)
% 2 - Video (Echtzeit)

%Start und Ende (Zeit)
s=0;
e=0.5;


%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=-1;
r=1;
u=-1;
o=1;

