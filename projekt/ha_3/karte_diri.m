%Erstellt Indexmatrizen für absorbierende Wände

function [diri_Ind1_r,diri_Ind1,diri_Ind2_r,diri_Ind2x,diri_Ind2y,diri_Ind3_r,diri_Ind3,diri_Ind4_r,diri_Ind4x,diri_Ind4y,diri_Ind5_r,diri_Ind5,diri_Ind6_r,diri_Ind6x,diri_Ind6y,diri_Ind7_r,diri_Ind7,diri_Ind8_r,diri_Ind8x,diri_Ind8y] = karte_diri(BK)
% erkennt wie groß BK ist
    [x,y] = size(BK);
%     Erstellt alle Indexmatrizen
% r steht für richtig(also die Position, wo die Randzelle ist)
    RK = zeros([x,y]);
    diri_Ind1_r = zeros([x,y]);
    diri_Ind1 = zeros([x,y]);
    diri_Ind2_r = zeros([x,y]);
    diri_Ind2x = zeros([x,y]);
    diri_Ind2y = zeros([x,y]);
    diri_Ind3_r = zeros([x,y]);
    diri_Ind3 = zeros([x,y]);
    diri_Ind4_r = zeros([x,y]);
    diri_Ind4x = zeros([x,y]);
    diri_Ind4y = zeros([x,y]);
    diri_Ind5_r = zeros([x,y]);
    diri_Ind5 = zeros([x,y]);
    diri_Ind6_r = zeros([x,y]);
    diri_Ind6x = zeros([x,y]);
    diri_Ind6y = zeros([x,y]);
    diri_Ind7_r = zeros([x,y]);
    diri_Ind7 = zeros([x,y]);
    diri_Ind8_r = zeros([x,y]);
    diri_Ind8x = zeros([x,y]);
    diri_Ind8y = zeros([x,y]);
%     Zwei For Schleifen, um alle Werte der Matrizen durchzugehen.
%     Randpunkte werden ausgelassen
    for i=2:x-1
        for ii=2:y-1
%             Guckt wie der Normalenvektor steht. 1 ist Rechts mittig, es
%             geht gegen Uhrzeigersinn
            isEcke = false;
            if BK(i,ii) == 3  
                if BK(i-1,ii+1) == 0 && BK(i,ii+1) == 0 && BK(i-1,ii) == 0
                    RK(i,ii) = 2;
                    diri_Ind2x(i-1,ii) = 1;
                    diri_Ind2y(i,ii+1) = 1;
                    diri_Ind2_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i-1,ii-1) == 0 && BK(i-1,ii) == 0 && BK(i,ii-1) == 0
                    RK(i,ii) = 4;
                    diri_Ind4x(i-1,ii) = 1; 
                    diri_Ind4y(i,ii-1) = 1; 
                    diri_Ind4_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i+1,ii-1) == 0 && BK(i,ii-1) == 0 && BK(i+1,ii) == 0
                    RK(i,ii) = 6;
                    diri_Ind6x(i+1,ii) = 1;  
                    diri_Ind6y(i,ii-1) = 1;
                    diri_Ind6_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i+1,ii+1) == 0 && BK(i,ii+1) == 0 && BK(i+1,ii) == 0
                    RK(i,ii) = 8;
                    diri_Ind8x(i+1,ii) = 1;  
                    diri_Ind8y(i,ii+1) = 1; 
                    diri_Ind8_r(i,ii) = 1;
                    isEcke = true;
                
                elseif (BK(i,ii+1) == 0 && (BK(i-1,ii+1) == 0 || BK(i+1,ii+1) == 0)) && isEcke == false
                    RK(i,ii) = 1;
                    diri_Ind1(i,ii+1) = 1; 
                    diri_Ind1_r(i,ii) = 1;
                    
                elseif (BK(i-1,ii) == 0 && (BK(i-1,ii+1) == 0 || BK(i-1,ii-1) == 0)) && isEcke == false
                    RK(i,ii) = 3;
                    diri_Ind3(i-1,ii) = 1;
                    diri_Ind3_r(i,ii) = 1;
                
                elseif (BK(i,ii-1) == 0 && (BK(i-1,ii-1) == 0 || BK(i+1,ii-1) == 0)) && isEcke == false
                    RK(i,ii) = 5;
                    diri_Ind5(i,ii-1) = 1;
                    diri_Ind5_r(i,ii) = 1;
                
                elseif (BK(i+1,ii) == 0 && (BK(i+1,ii-1) == 0 || BK(i+1,ii+1) == 0)) && isEcke == false
                    RK(i,ii) = 7;
                    diri_Ind7(i+1,ii) = 1;
                    diri_Ind7_r(i,ii) = 1;
               
                end
            end
        end
    end
%     linker Rand
    for i1=2:x-1
        if BK(i1,2) == 0 && BK(i1,1) == 3
            RK(i1,1) = 1;
            diri_Ind1(i1,2) = 1;
            diri_Ind1_r(i1,1) = 1;
        end
    end        
%   rechter Rand      
    for i5=2:x-1
        if BK(i5,y-1) == 0 && BK(i5,y) == 3
            RK(i5,y)=5;
            diri_Ind5(i5,y-1) = 1;
            diri_Ind5_r(i5,y) = 1;
        end
    end
%     obere Rand
    for i3=2:y-1
        if BK(2,i3) == 0 && BK(1,i3) == 3
            RK(1,i3) = 7;
            diri_Ind7(2,i3) = 1;
            diri_Ind7_r(1,i3) = 1;
        end
    end
%     untere Rand
    for i7=2:y-1
        if BK(x-1,i7) == 0 && BK(x,i7) == 3
            RK(x,i7) = 3;
            diri_Ind3(x-1,i7) = 1;
            diri_Ind3_r(x,i7) = 1;
        end
    end
    
%     Erstellen der logikmatrizen
    diri_Ind1_r = logical(diri_Ind1_r);
    diri_Ind1 = logical(diri_Ind1);
    diri_Ind2_r = logical(diri_Ind2_r);
    diri_Ind2x = logical(diri_Ind2x);
    diri_Ind2y = logical(diri_Ind2y);
    diri_Ind3_r = logical(diri_Ind3_r);
    diri_Ind3 = logical(diri_Ind3);
    diri_Ind4_r = logical(diri_Ind4_r);
    diri_Ind4x = logical(diri_Ind4x);
    diri_Ind4y = logical(diri_Ind4y);
    diri_Ind5_r = logical(diri_Ind5_r);
    diri_Ind5 = logical(diri_Ind5);
    diri_Ind6_r = logical(diri_Ind6_r);
    diri_Ind6x = logical(diri_Ind6x);
    diri_Ind6y = logical(diri_Ind6y);
    diri_Ind7_r = logical(diri_Ind7_r);
    diri_Ind7 = logical(diri_Ind7);
    diri_Ind8_r = logical(diri_Ind8_r);
    diri_Ind8x = logical(diri_Ind8x);
    diri_Ind8y = logical(diri_Ind8y);
    
    
    %Erstellung Indexmatrizen abgeschlossen
    
    %Ueberpruefung, welcher Rand absorbierunt und welcher reflektiert, dazu
    %BK erneut auslesen. 
    %Werte in BK:
    %   1=absorbiert
    %   2=reflektiert
    %   3=Dirichlet