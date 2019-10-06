% dx= 1;
% dy= 1;

% Absorbierende Waende (1)
H((Ind1_r)) = H(Ind1);
H((Ind3_r)) = H((Ind3));
H((Ind5_r)) = H((Ind5));
H((Ind7_r)) = H((Ind7));
H((Ind2_r)) = (dy .* H((Ind2x)) + dx .* H((Ind2y)))./(dx + dy);
H((Ind4_r)) = (dy .* H((Ind4x)) + dx .* H((Ind4y)))./(dx + dy);
H((Ind6_r)) = (dy .* H((Ind6x)) + dx .* H((Ind6y)))./(dx + dy);
H((Ind8_r)) = (dy .* H((Ind8x)) + dx .* H((Ind8y)))./(dx + dy);
    
HU((Ind1_r)) = HU((Ind1));
HU((Ind3_r)) = HU((Ind3));
HU((Ind5_r)) = HU((Ind5));
HU((Ind7_r)) = HU((Ind7));
HU((Ind2_r)) = (dy .* HU((Ind2x)) + dx .* HU((Ind2y)))./(dx + dy);
HU((Ind4_r)) = (dy .* HU((Ind4x)) + dx .* HU((Ind4y)))./(dx + dy);
HU((Ind6_r)) = (dy .* HU((Ind6x)) + dx .* HU((Ind6y)))./(dx + dy);
HU((Ind8_r)) = (dy .* HU((Ind8x)) + dx .* HU((Ind8y)))./(dx + dy);

HV((Ind1_r)) = HV((Ind1));
HV((Ind3_r)) = HV((Ind3));
HV((Ind5_r)) = HV((Ind5));
HV((Ind7_r)) = HV((Ind7));
HV((Ind2_r)) = (dy .* HV((Ind2x)) + dx .* HV((Ind2y)))./(dx + dy);
HV((Ind4_r)) = (dy .* HV((Ind4x)) + dx .* HV((Ind4y)))./(dx + dy);
HV((Ind6_r)) = (dy .* HV((Ind6x)) + dx .* HV((Ind6y)))./(dx + dy);
HV((Ind8_r)) = (dy .* HV((Ind8x)) + dx .* HV((Ind8y)))./(dx + dy);

%-------------------------------------------------------------------------
% Reflektierende Waende (2)

H((r_Ind1_r)) = H((r_Ind1));
H((r_Ind3_r)) = H((r_Ind3));
H((r_Ind5_r)) = H((r_Ind5));
H((r_Ind7_r)) = H((r_Ind7));
H((r_Ind2_r)) = (dy .* H((r_Ind2x)) + dx .* H((r_Ind2y)))./(dx + dy);
H((r_Ind4_r)) = (dy .* H((r_Ind4x)) + dx .* H((r_Ind4y)))./(dx + dy);
H((r_Ind6_r)) = (dy .* H((r_Ind6x)) + dx .* H((r_Ind6y)))./(dx + dy);
H((r_Ind8_r)) = (dy .* H((r_Ind8x)) + dx .* H((r_Ind8y)))./(dx + dy);


HU((r_Ind1_r)) = HU((r_Ind1));
HU((r_Ind3_r)) = -HU((r_Ind3));
HU((r_Ind5_r)) = HU((r_Ind5));
HU((r_Ind7_r)) = -HU((r_Ind7));

% HU((r_Ind2_r)) = 0;
% HU((r_Ind4_r)) = 0;
% HU((r_Ind6_r)) = 0;
% HU((r_Ind8_r)) = 0;
% HU((r_Ind2_r)) = -(dy .* HU((r_Ind2x)) + dx .* HU((r_Ind2y)))./(dx + dy);
% HU((r_Ind4_r)) = -(dy .* HU((r_Ind4x)) + dx .* HU((r_Ind4y)))./(dx + dy);
% HU((r_Ind6_r)) = -(dy .* HU((r_Ind6x)) + dx .* HU((r_Ind6y)))./(dx + dy);
% HU((r_Ind8_r)) = -(dy .* HU((r_Ind8x)) + dx .* HU((r_Ind8y)))./(dx + dy);
HU((r_Ind2_r)) = -(dy .* HU((r_Ind2x)) + dx .* HU((r_Ind2y)))./(dx + dy);
HU((r_Ind4_r)) = -(dy .* HU((r_Ind4x)) + dx .* HU((r_Ind4y)))./(dx + dy);
HU((r_Ind6_r)) = -(dy .* HU((r_Ind6x)) + dx .* HU((r_Ind6y)))./(dx + dy);
HU((r_Ind8_r)) = -(dy .* HU((r_Ind8x)) + dx .* HU((r_Ind8y)))./(dx + dy);


HV((r_Ind1_r)) = -HV((r_Ind1));
HV((r_Ind3_r)) = HV((r_Ind3));
HV((r_Ind5_r)) = -HV((r_Ind5));
HV((r_Ind7_r)) = HV((r_Ind7));

% HV((r_Ind2_r)) = 0;
% HV((r_Ind4_r)) = 0;
% HV((r_Ind6_r)) = 0;
% HV((r_Ind8_r)) = 0;
% HV((r_Ind2_r)) = -(dy .* HV((r_Ind2x)) + dx .* HV((r_Ind2y)))./(dx + dy);
% HV((r_Ind4_r)) = -(dy .* HV((r_Ind4x)) + dx .* HV((r_Ind4y)))./(dx + dy);
% HV((r_Ind6_r)) = -(dy .* HV((r_Ind6x)) + dx .* HV((r_Ind6y)))./(dx + dy);
% HV((r_Ind8_r)) = -(dy .* HV((r_Ind8x)) + dx .* HV((r_Ind8y)))./(dx + dy);
HV((r_Ind2_r)) = -(dy .* HV((r_Ind2x)) + dx .* HV((r_Ind2y)))./(dx + dy);
HV((r_Ind4_r)) = -(dy .* HV((r_Ind4x)) + dx .* HV((r_Ind4y)))./(dx + dy);
HV((r_Ind6_r)) = -(dy .* HV((r_Ind6x)) + dx .* HV((r_Ind6y)))./(dx + dy);
HV((r_Ind8_r)) = -(dy .* HV((r_Ind8x)) + dx .* HV((r_Ind8y)))./(dx + dy);



%-------------------------------------------------------------------------
% dirichlet Randbedingung (3)

if  dirit ~= 0
    if hei == 0
        diri = 50;
    elseif hei == 1
        diri = 0.5.*sin(100.*t)+5;
    end
    
    if imp == 0
        dirimp = 6;
    elseif imp == 1
        dirimp = 0.5.*sin(100.*t)+5;
    end
    
    if dirit == 1
        H((diri_Ind1_r)) = diri;
        H((diri_Ind3_r)) = H((diri_Ind3));
        H((diri_Ind5_r)) = diri;
        H((diri_Ind7_r)) = H((diri_Ind7));
        H((diri_Ind2_r)) = (dy .* H((diri_Ind2x)) + dx .* H((diri_Ind2y)))./(dx + dy);
        H((diri_Ind4_r)) = (dy .* H((diri_Ind4x)) + dx .* H((diri_Ind4y)))./(dx + dy);
        H((diri_Ind6_r)) = (dy .* H((diri_Ind6x)) + dx .* H((diri_Ind6y)))./(dx + dy);
        H((diri_Ind8_r)) = (dy .* H((diri_Ind8x)) + dx .* H((diri_Ind8y)))./(dx + dy);


        HU((diri_Ind1_r)) = HU((diri_Ind1));
        HU((diri_Ind3_r)) = HU((diri_Ind3));
        HU((diri_Ind5_r)) = HU((diri_Ind5));
        HU((diri_Ind7_r)) = HU((diri_Ind7));
        HU((diri_Ind2_r)) = (dy .* HU((diri_Ind2x)) + dx .* HU((diri_Ind2y)))./(dx + dy);
        HU((diri_Ind4_r)) = (dy .* HU((diri_Ind4x)) + dx .* HU((diri_Ind4y)))./(dx + dy);
        HU((diri_Ind6_r)) = (dy .* HU((diri_Ind6x)) + dx .* HU((diri_Ind6y)))./(dx + dy);
        HU((diri_Ind8_r)) = (dy .* HU((diri_Ind8x)) + dx .* HU((diri_Ind8y)))./(dx + dy);

        HV((diri_Ind1_r)) = HV((diri_Ind1));
        HV((diri_Ind3_r)) = HV((diri_Ind3));
        HV((diri_Ind5_r)) = HV((diri_Ind5));
        HV((diri_Ind7_r)) = HV((diri_Ind7));
        HV((diri_Ind2_r)) = (dy .* HV((diri_Ind2x)) + dx .* HV((diri_Ind2y)))./(dx + dy);
        HV((diri_Ind4_r)) = (dy .* HV((diri_Ind4x)) + dx .* HV((diri_Ind4y)))./(dx + dy);
        HV((diri_Ind6_r)) = (dy .* HV((diri_Ind6x)) + dx .* HV((diri_Ind6y)))./(dx + dy);
        HV((diri_Ind8_r)) = (dy .* HV((diri_Ind8x)) + dx .* HV((diri_Ind8y)))./(dx + dy);
        
    elseif dirit == 2
        H((diri_Ind1_r)) = H(diri_Ind1);
        H((diri_Ind3_r)) = H((diri_Ind3));
        H((diri_Ind5_r)) = H((diri_Ind5));
        H((diri_Ind7_r)) = H((diri_Ind7));
        H((diri_Ind2_r)) = (dy .* H((diri_Ind2x)) + dx .* H((diri_Ind2y)))./(dx + dy);
        H((diri_Ind4_r)) = (dy .* H((diri_Ind4x)) + dx .* H((diri_Ind4y)))./(dx + dy);
        H((diri_Ind6_r)) = (dy .* H((diri_Ind6x)) + dx .* H((diri_Ind6y)))./(dx + dy);
        H((diri_Ind8_r)) = (dy .* H((diri_Ind8x)) + dx .* H((diri_Ind8y)))./(dx + dy);


        HU((diri_Ind1_r)) = HU((diri_Ind1));
        HU((diri_Ind3_r)) = HU((diri_Ind3));
        HU((diri_Ind5_r)) = HU((diri_Ind5));
        HU((diri_Ind7_r)) = HU((diri_Ind7));
        HU((diri_Ind2_r)) = (dy .* HU((diri_Ind2x)) + dx .* HU((diri_Ind2y)))./(dx + dy);
        HU((diri_Ind4_r)) = (dy .* HU((diri_Ind4x)) + dx .* HU((diri_Ind4y)))./(dx + dy);
        HU((diri_Ind6_r)) = (dy .* HU((diri_Ind6x)) + dx .* HU((diri_Ind6y)))./(dx + dy);
        HU((diri_Ind8_r)) = (dy .* HU((diri_Ind8x)) + dx .* HU((diri_Ind8y)))./(dx + dy);

        HV((diri_Ind1_r)) = dirimp;
        HV((diri_Ind3_r)) = HV((diri_Ind3));
        HV((diri_Ind5_r)) = dirimp;
        HV((diri_Ind7_r)) = HV((diri_Ind7));
        HV((diri_Ind2_r)) = (dy .* HV((diri_Ind2x)) + dx .* HV((diri_Ind2y)))./(dx + dy);
        HV((diri_Ind4_r)) = (dy .* HV((diri_Ind4x)) + dx .* HV((diri_Ind4y)))./(dx + dy);
        HV((diri_Ind6_r)) = (dy .* HV((diri_Ind6x)) + dx .* HV((diri_Ind6y)))./(dx + dy);
        HV((diri_Ind8_r)) = (dy .* HV((diri_Ind8x)) + dx .* HV((diri_Ind8y)))./(dx + dy);
        
    elseif dirit == 3
        H((diri_Ind1_r)) = H(diri_Ind1);
        H((diri_Ind3_r)) = diri;
        H((diri_Ind5_r)) = H((diri_Ind5));
        H((diri_Ind7_r)) = diri;
        H((diri_Ind2_r)) = (dy .* H((diri_Ind2x)) + dx .* H((diri_Ind2y)))./(dx + dy);
        H((diri_Ind4_r)) = (dy .* H((diri_Ind4x)) + dx .* H((diri_Ind4y)))./(dx + dy);
        H((diri_Ind6_r)) = (dy .* H((diri_Ind6x)) + dx .* H((diri_Ind6y)))./(dx + dy);
        H((diri_Ind8_r)) = (dy .* H((diri_Ind8x)) + dx .* H((diri_Ind8y)))./(dx + dy);


        HU((diri_Ind1_r)) = HU((diri_Ind1));
        HU((diri_Ind3_r)) = HU((diri_Ind3));
        HU((diri_Ind5_r)) = HU((diri_Ind5));
        HU((diri_Ind7_r)) = HU((diri_Ind7));
        HU((diri_Ind2_r)) = (dy .* HU((diri_Ind2x)) + dx .* HU((diri_Ind2y)))./(dx + dy);
        HU((diri_Ind4_r)) = (dy .* HU((diri_Ind4x)) + dx .* HU((diri_Ind4y)))./(dx + dy);
        HU((diri_Ind6_r)) = (dy .* HU((diri_Ind6x)) + dx .* HU((diri_Ind6y)))./(dx + dy);
        HU((diri_Ind8_r)) = (dy .* HU((diri_Ind8x)) + dx .* HU((diri_Ind8y)))./(dx + dy);

        HV((diri_Ind1_r)) = HV((diri_Ind1));
        HV((diri_Ind3_r)) = HV((diri_Ind3));
        HV((diri_Ind5_r)) = HV((diri_Ind5));
        HV((diri_Ind7_r)) = HV((diri_Ind7));
        HV((diri_Ind2_r)) = (dy .* HV((diri_Ind2x)) + dx .* HV((diri_Ind2y)))./(dx + dy);
        HV((diri_Ind4_r)) = (dy .* HV((diri_Ind4x)) + dx .* HV((diri_Ind4y)))./(dx + dy);
        HV((diri_Ind6_r)) = (dy .* HV((diri_Ind6x)) + dx .* HV((diri_Ind6y)))./(dx + dy);
        HV((diri_Ind8_r)) = (dy .* HV((diri_Ind8x)) + dx .* HV((diri_Ind8y)))./(dx + dy);
        
    elseif dirit == 4
        H((diri_Ind1_r)) = H(diri_Ind1);
        H((diri_Ind3_r)) = H((diri_Ind3));
        H((diri_Ind5_r)) = H((diri_Ind5));
        H((diri_Ind7_r)) = H((diri_Ind7));
        H((diri_Ind2_r)) = (dy .* H((diri_Ind2x)) + dx .* H((diri_Ind2y)))./(dx + dy);
        H((diri_Ind4_r)) = (dy .* H((diri_Ind4x)) + dx .* H((diri_Ind4y)))./(dx + dy);
        H((diri_Ind6_r)) = (dy .* H((diri_Ind6x)) + dx .* H((diri_Ind6y)))./(dx + dy);
        H((diri_Ind8_r)) = (dy .* H((diri_Ind8x)) + dx .* H((diri_Ind8y)))./(dx + dy);


        HU((diri_Ind1_r)) = HU((diri_Ind1));
        HU((diri_Ind3_r)) = dirimp;
        HU((diri_Ind5_r)) = HU((diri_Ind5));
        HU((diri_Ind7_r)) = dirimp;
        HU((diri_Ind2_r)) = (dy .* HU((diri_Ind2x)) + dx .* HU((diri_Ind2y)))./(dx + dy);
        HU((diri_Ind4_r)) = (dy .* HU((diri_Ind4x)) + dx .* HU((diri_Ind4y)))./(dx + dy);
        HU((diri_Ind6_r)) = (dy .* HU((diri_Ind6x)) + dx .* HU((diri_Ind6y)))./(dx + dy);
        HU((diri_Ind8_r)) = (dy .* HU((diri_Ind8x)) + dx .* HU((diri_Ind8y)))./(dx + dy);

        HV((diri_Ind1_r)) = HV((diri_Ind1));
        HV((diri_Ind3_r)) = HV((diri_Ind3));
        HV((diri_Ind5_r)) = HV((diri_Ind5));
        HV((diri_Ind7_r)) = HV((diri_Ind7));
        HV((diri_Ind2_r)) = (dy .* HV((diri_Ind2x)) + dx .* HV((diri_Ind2y)))./(dx + dy);
        HV((diri_Ind4_r)) = dirimp;
        HV((diri_Ind6_r)) = (dy .* HV((diri_Ind6x)) + dx .* HV((diri_Ind6y)))./(dx + dy);
        HV((diri_Ind8_r)) = dirimp;
    end
end