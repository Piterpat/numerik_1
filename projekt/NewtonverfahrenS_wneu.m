% S_w wird deklariert um erste Schleife zu ermöglichen
S_w = 1;
S_wneu = 3;

% Konstanten
g = 9.81;
h_R = 0.5;
h_L = 1;

% Für die Ableitung wird eine Schrittweite benötigt
h = 0.1;


% Schleife wird solange ausgeführt, bis die Veränderung kleiner als 1^-6
% ist.
while abs(S_w-S_wneu) > 1^(-6)
    S_w = S_wneu;
    
%     U2 und c2 werden in der Schleife berechnet mit dem alten Sw
    u_2 = S_w - (( g .* h_R) ./ (4 .* S_w)) .* (1+ sqrt(1+ ((8 .* S_w.^2)./(g .* h_R))));
    c_2 = sqrt(((g .* h_R) ./ (2)) .* (sqrt(1+ ((8 .* S_w.^2)./(g .* h_R))) -1 ));
%     u2 und c2 werden für die Ableitung mit Sw + h benötigt
    u_2h = (S_w + h) - (( g .* h_R) ./ (4 .* (S_w + h))) .* (1+ sqrt(1+ ((8 .* (S_w + h).^2)./(g .* h_R))));
    c_2h = sqrt(((g .* h_R) ./ (2)) .* (sqrt(1+ ((8 .* (S_w + h).^2)./(g .* h_R))) -1 ));
%    neuer Sw Wert berechnet
    S_wneu = S_w - ( (u_2+2.*c_2-2.*sqrt(g .* h_L))./ (((u_2h + 2.*c_2h-2.*sqrt(g .* h_L))-(u_2+2.*c_2-2.*sqrt(g .* h_L)))./ h));
end

S_wneu