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

HU((r_Ind1_r)) = -HU((r_Ind1));
HU((r_Ind3_r)) = -HU((r_Ind3));
HU((r_Ind5_r)) = -HU((r_Ind5));
HU((r_Ind7_r)) = -HU((r_Ind7));
HU((r_Ind2_r)) = -(dy .* HU((r_Ind2x)) + dx .* HU((r_Ind2y)))./(dx + dy);
HU((r_Ind4_r)) = -(dy .* HU((r_Ind4x)) + dx .* HU((r_Ind4y)))./(dx + dy);
HU((r_Ind6_r)) = -(dy .* HU((r_Ind6x)) + dx .* HU((r_Ind6y)))./(dx + dy);
HU((r_Ind8_r)) = -(dy .* HU((r_Ind8x)) + dx .* HU((r_Ind8y)))./(dx + dy);

HV((r_Ind1_r)) = -HV((r_Ind1));
HV((r_Ind3_r)) = -HV((r_Ind3));
HV((r_Ind5_r)) = -HV((r_Ind5));
HV((r_Ind7_r)) = -HV((r_Ind7));
HV((r_Ind2_r)) = -(dy .* HV((r_Ind2x)) + dx .* HV((r_Ind2y)))./(dx + dy);
HV((r_Ind4_r)) = -(dy .* HV((r_Ind4x)) + dx .* HV((r_Ind4y)))./(dx + dy);
HV((r_Ind6_r)) = -(dy .* HV((r_Ind6x)) + dx .* HV((r_Ind6y)))./(dx + dy);
HV((r_Ind8_r)) = -(dy .* HV((r_Ind8x)) + dx .* HV((r_Ind8y)))./(dx + dy);
