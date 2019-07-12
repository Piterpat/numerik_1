clear

g=9.81;

CFL=(1./sqrt(2))-0.05;

kartenart = 0;
% 0 - Dammbruch Spalt

anfangsbedingung=2;
% 0 - Wassertropfen
% 1 - Welle nach innen
% 2 - Sinusbecken
% 3 - Dammbruch

bodenart = 0;
% 0 - Wellenboden
% 1 - Schräge
% 2 - Stufe

viewart = 1;
% 0 - top-down
% 1 - isometrisch

%linker und rechter Rand (Ort) fuer x oberer und unterer fuer y
l=-1;
r=1;
u=-1;
o=1;

%Start und Ende (Zeit)
s=0;
e=2;
