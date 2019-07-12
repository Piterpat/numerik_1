% function [H,HU,HV] = randbedingung (Ind1,Ind2x,Ind2y,Ind3,Ind4x,Ind4y,Ind5,Ind6x,Ind6y,Ind7,Ind8x,Ind8y,HV,H,HU,BK,fun)
%     [x,~] = size(H);
%     %     1 ist eine absorbierende,2 eine reflektierende und 3 eine Vorgegebene
% %     Wand
% %     Randbedingungen werden f�r die Kanten vorgegeben(Zelltyp 1,3,5,7)
%     i1 = find (Ind1);
%     k = size(i1);
%     for i=1:k
%         if BK(i1(i)-x)==1
%             H(i1(i)-x) = H(i1(i));
%             HU(i1(i)-x) = HU(i1(i));
%             HV(i1(i)-x) = HV(i1(i));
%         end
%         if BK(i1(i)-x)==2
%             H(i1(i)-x) = H(i1(i));
%             HU(i1(i)-x) = -HU(i1(i));
%             HV(i1(i)-x) = -HV(i1(i));
%         end
% %        Hier muss noch die dritte Randbedingung vorgegeben werden
%     end
%     
%      i3 = find (Ind3);
%     k = size(i3);
%     for i=1:k
%         if BK(i3(i)+1)==1
%             H(i3(i)+1) = H(i3(i));
%             HU(i3(i)+1) = HU(i3(i));
%             HV(i3(i)+1) = HV(i3(i));
%         end
%         if BK(i3(i)+1)==2
%             H(i3(i)+1) = H(i3(i));
%             HU(i3(i)+1) = -HU(i3(i));
%             HV(i3(i)+1) = -HV(i3(i));
%         end
% %        Hier muss noch die dritte Randbedingung vorgegeben werden
%     end
%     
%      i5 = find (Ind5);
%     k = size(i5);
%     for i=1:k
%         if BK(i5(i)+x)==1
%             H(i5(i)+x) = H(i5(i));
%             HU(i5(i)+x) = HU(i5(i));
%             HV(i5(i)+x) = HV(i5(i));
%         end
%         if BK(i5(i)+x)==2
%             H(i5(i)+x) = H(i5(i));
%             HU(i5(i)+x) = -HU(i5(i));
%             HV(i5(i)+x) = -HV(i5(i));
%         end
% %        Hier muss noch die dritte Randbedingung vorgegeben werden
%     end
%     
%      i7 = find (Ind7);
%     k = size(i7);
%     for i=1:k
%         if BK(i7(i)-1)==1
%             H(i7(i)-1) = H(i7(i));
%             HU(i7(i)-1) = HU(i7(i));
%             HV(i7(i)-1) = HV(i7(i));
%         end
%         if BK(i7(i)-1)==2
%             H(i7(i)-1) = H(i7(i));
%             HU(i7(i)-1) = -HU(i7(i));
%             HV(i7(i)-1) = -HV(i7(i));
%         end
% %        Hier muss noch die dritte Randbedingung vorgegeben werden
%     end
%     
% %     Das gleiche nur f�r Ecken(Zellen 2,4,6,8)
%     i2x = find(Ind2x);
%     i2y = find(Ind2y);
%     
%     k = size(i2x);
%     for i=1:k
%         if BK(i2x(i)+1)==1
%             H(i2x(i)+1) = (0.5 .* H(i2x(i))) + (0.5 .* H(i2y(i));
%             HU(i2x(i)+1) = (0.5 .* HU(i2x(i))) + (0.5 .* HU(i2y(i));
%             HV(i2x(i)+1) = (0.5 .* HV(i2x(i))) + (0.5 .* HV(i2y(i)));
%         end
%         if BK(i2x(i)+1)==2
%              H(i2x(i)+1) = (0.5 .* H(i2x(i))) + (0.5 .* H(i2y(i));
%             HU(i2x(i)+1) = (0.5 .* HU(i2x(i))) + (0.5 .* HU(i2y(i));
%             HV(i2x(i)+1) = (0.5 .* HV(i2x(i))) + (0.5 .* HV(i2y(i)));
%         end

% dx= 1;
% dy= 1;
H(logical(Ind1_r)) = H(logical(Ind1));
H(logical(Ind3_r)) = H(logical(Ind3));
H(logical(Ind5_r)) = H(logical(Ind5));
H(logical(Ind7_r)) = H(logical(Ind7));
H(logical(Ind2_r)) = (dy .* H(logical(Ind2x)) + dx .* H(logical(Ind2y)))./(dx + dy);
H(logical(Ind4_r)) = (dy .* H(logical(Ind4x)) + dx .* H(logical(Ind4y)))./(dx + dy);
H(logical(Ind6_r)) = (dy .* H(logical(Ind6x)) + dx .* H(logical(Ind6y)))./(dx + dy);
H(logical(Ind8_r)) = (dy .* H(logical(Ind8x)) + dx .* H(logical(Ind8y)))./(dx + dy);

HU(logical(Ind1_r)) = HU(logical(Ind1));
HU(logical(Ind3_r)) = HU(logical(Ind3));
HU(logical(Ind5_r)) = HU(logical(Ind5));
HU(logical(Ind7_r)) = HU(logical(Ind7));
HU(logical(Ind2_r)) = (dy .* HU(logical(Ind2x)) + dx .* HU(logical(Ind2y)))./(dx + dy);
HU(logical(Ind4_r)) = (dy .* HU(logical(Ind4x)) + dx .* HU(logical(Ind4y)))./(dx + dy);
HU(logical(Ind6_r)) = (dy .* HU(logical(Ind6x)) + dx .* HU(logical(Ind6y)))./(dx + dy);
HU(logical(Ind8_r)) = (dy .* HU(logical(Ind8x)) + dx .* HU(logical(Ind8y)))./(dx + dy);

HV(logical(Ind1_r)) = HV(logical(Ind1));
HV(logical(Ind3_r)) = HV(logical(Ind3));
HV(logical(Ind5_r)) = HV(logical(Ind5));
HV(logical(Ind7_r)) = HV(logical(Ind7));
HV(logical(Ind2_r)) = (dy .* HV(logical(Ind2x)) + dx .* HV(logical(Ind2y)))./(dx + dy);
HV(logical(Ind4_r)) = (dy .* HV(logical(Ind4x)) + dx .* HV(logical(Ind4y)))./(dx + dy);
HV(logical(Ind6_r)) = (dy .* HV(logical(Ind6x)) + dx .* HV(logical(Ind6y)))./(dx + dy);
HV(logical(Ind8_r)) = (dy .* HV(logical(Ind8x)) + dx .* HV(logical(Ind8y)))./(dx + dy);

% reflektlogical(Ierende W�nde werden berechnet

H(logical(r_Ind1_r)) = H(logical(r_Ind1));
H(logical(r_Ind3_r)) = H(logical(r_Ind3));
H(logical(r_Ind5_r)) = H(logical(r_Ind5));
H(logical(r_Ind7_r)) = H(logical(r_Ind7));
H(logical(r_Ind2_r)) = (dy .* H(logical(r_Ind2x)) + dx .* H(logical(r_Ind2y)))./(dx + dy);
H(logical(r_Ind4_r)) = (dy .* H(logical(r_Ind4x)) + dx .* H(logical(r_Ind4y)))./(dx + dy);
H(logical(r_Ind6_r)) = (dy .* H(logical(r_Ind6x)) + dx .* H(logical(r_Ind6y)))./(dx + dy);
H(logical(r_Ind8_r)) = (dy .* H(logical(r_Ind8x)) + dx .* H(logical(r_Ind8y)))./(dx + dy);

HU(logical(r_Ind1_r)) = - HU(logical(r_Ind1));
HU(logical(r_Ind3_r)) = - HU(logical(r_Ind3));
HU(logical(r_Ind5_r)) =  HU(logical(r_Ind5));
HU(logical(r_Ind7_r)) =  HU(logical(r_Ind7));
HU(logical(r_Ind2_r)) = -(dy .* HU(logical(r_Ind2x)) + dx .* HU(logical(r_Ind2y)))./(dx + dy);
HU(logical(r_Ind4_r)) = -(dy .* HU(logical(r_Ind4x)) + dx .* HU(logical(r_Ind4y)))./(dx + dy);
HU(logical(r_Ind6_r)) = -(dy .* HU(logical(r_Ind6x)) + dx .* HU(logical(r_Ind6y)))./(dx + dy);
HU(logical(r_Ind8_r)) = -(dy .* HU(logical(r_Ind8x)) + dx .* HU(logical(r_Ind8y)))./(dx + dy);

HV(logical(r_Ind1_r)) =  HV(logical(r_Ind1));
HV(logical(r_Ind3_r)) =  HV(logical(r_Ind3));
HV(logical(r_Ind5_r)) = - HV(logical(r_Ind5));
HV(logical(r_Ind7_r)) = - HV(logical(r_Ind7));
HV(logical(r_Ind2_r)) = -(dy .* HV(logical(r_Ind2x)) + dx .* HV(logical(r_Ind2y)))./(dx + dy);
HV(logical(r_Ind4_r)) = -(dy .* HV(logical(r_Ind4x)) + dx .* HV(logical(r_Ind4y)))./(dx + dy);
HV(logical(r_Ind6_r)) = -(dy .* HV(logical(r_Ind6x)) + dx .* HV(logical(r_Ind6y)))./(dx + dy);
HV(logical(r_Ind8_r)) = -(dy .* HV(logical(r_Ind8x)) + dx .* HV(logical(r_Ind8y)))./(dx + dy);

    