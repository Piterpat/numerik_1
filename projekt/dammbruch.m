% Die Funktion dammbruch gibt die analytische Lösung des Dammbruchproblems
% zurück. Dabei wird der Ort x, die Zeit t, x0, h_L, h_R und S_w übergeben
% und die Funktion gibt die höhe und die Strömungsgeschwindigkeit an diesem
% Ort und der Zeit an.
function [h,u] = dammbruch(x,t,x0,h_L,h_R,S_w)
    g = 9.81;
    u_2 = S_w - (( g .* h_R) ./ (4 .* S_w)) .* (1+ sqrt(1+ ((8 .* S_w.^2)./(g .* h_R))));
    c_2 = sqrt(((g .* h_R) ./ (2)) .* (sqrt(1+ ((8 .* S_w.^2)./(g .* h_R))) -1 ));
    x_A = x0 - t .* sqrt(g.*h_L);
    x_B = x0 + t .* (u_2 - c_2);
    x_C = x0 + S_w .*t;
    
%     S_w1 = 0
%     while abs(S_w1-S_w)>10^-6       %Korrektur mit Newton
%       S_w=S_w1-polyval(a,x0)/polyval(aStrich,x0);
%     end
    
    if x < x_A
        h = h_L;
        u = 0;
    end
    
    if (x >= x_A) && (x <= x_B)
        h = (1 ./ (9.* g)) .* (2 .* sqrt(g .* h_L) - ((2 .* x - 2 .* x0) ./ (2 .* t))).^2;
        u = (2 ./ (3 .* t)) .* (x - x0 + t .* sqrt(g .* h_L));
    end
    
    if (x > x_B) && (x <= x_C)
        h = (h_R ./ 2) .* (sqrt(1+((8 .* S_w.^2)./(g .* h_R))) - 1);
        u = u_2;
    end
    
    if x>x_C
        h = h_R;
        u = 0;
    end
        