clear

g=9.81;

CFL=(1./sqrt(2))-0.05;

kartenrand = 0;
% 0 - absorbierend
% 1 - reflektierend

kartenart = 1;
% 0 - nur Rand
% 1 - Dammbruch Spalt
% 2 - Pylon
% 3 - Viertel

anfangsbedingung=3;
% 0 - Wassertropfen
% 1 - Welle nach innen
% 2 - Sinusbecken
% 3 - Dammbruch
% 4 - Flach

bodenart = 0;
% 0 - kein Boden
% 1 - Wellenboden
% 2 - Schraege
% 3 - Stufe
% 4 - Flach
% 5 - Kuppel

viewart = 13;
% 0 - top-down
% 1 - isometrisch
% 2 - seite x
% 3 - seite y
% 4 - seite xy
% 5 - seite y zu ismoetrisch
    p = 172;

videoart = 0;
% 0 - kein Video
% 1 - Video (wie geplottet)
% 2 - Video (Echtzeit)

%Start und Ende (Zeit)
s=0;
e=1;

%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=-1;
r=1;
u=-1;
o=1;

