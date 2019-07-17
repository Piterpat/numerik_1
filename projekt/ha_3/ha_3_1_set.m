clear

g=9.81;

CFL=(1./sqrt(2))-0.05;

kartenrand = 0;
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

anfangsbedingung = 5;
% 0 - Wassertropfen
% 1 - Welle nach innen
% 2 - Sinusbecken
% 3 - Dammbruch
% 4 - Flach
% 5 - Valdierung

bodenart = 0;
% 0 - kein Boden
% 1 - Wellenboden
% 2 - Schraege
% 3 - Stufe
% 4 - Flach
% 5 - Kuppel


viewart = 5;
% 0 - top-down
% 1 - isometrisch
% 2 - seite x
% 3 - seite y
% 4 - seite xy
% 5 - seite y zu ismoetrisch 2
    p = 229;
    d = 20;
% 6 - Isometrisch 2


videoart = 1;
% 0 - kein Video
% 1 - Video (wie geplottet)
% 2 - Video (Echtzeit)

%Start und Ende (Zeit)
s=0;
e=0.25;


%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=0;
r=1;
u=0;
o=1;

