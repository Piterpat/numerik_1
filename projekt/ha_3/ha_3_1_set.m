clear

g=9.81;

CFL=(1./sqrt(2))-0.05;

kartenart = 0;
% 0 - nur Rand
% 1 - Dammbruch Spalt

anfangsbedingung=3;
% 0 - Wassertropfen
% 1 - Welle nach innen
% 2 - Sinusbecken
% 3 - Dammbruch
% 4 - Flach

bodenflag = 0;
% 0 - Boden aus
% 1 - Boden an

bodenart = 4;
% 0 - Wellenboden
% 1 - Schraege
% 2 - Stufe
% 3 - Flach
% 4 - Kuppel

viewart = 1;
% 0 - top-down
% 1 - isometrisch
% 2 - seite x
% 3 - seite y
% 4 - seite xy

%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=-1;
r=1;
u=-1;
o=1;

%Start und Ende (Zeit)
s=0;
e=2;
