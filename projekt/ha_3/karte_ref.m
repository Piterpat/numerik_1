% Erstellt Indexmatrizen für reflektierende Wände
function [RK,r_Ind1_r,r_Ind1,r_Ind2_r,r_Ind2x,r_Ind2y,r_Ind3_r,r_Ind3,r_Ind4_r,r_Ind4x,r_Ind4y,r_Ind5_r,r_Ind5,r_Ind6_r,r_Ind6x,r_Ind6y,r_Ind7_r,r_Ind7,r_Ind8_r,r_Ind8x,r_Ind8y] = karte_ref(BK)
% erkennt wie groß BK ist
    [x,y] = size(BK);
%     Erstellt alle Indexmatrizen
% r steht für richtig(also die Position, wo die Randzelle ist)
% Das r am Anfang steht für reflektierend
    RK = zeros([x,y]);
    r_Ind1_r = zeros([x,y]);
    r_Ind1 = zeros([x,y]);
    r_Ind2_r = zeros([x,y]);
    r_Ind2x = zeros([x,y]);
    r_Ind2y = zeros([x,y]);
    r_Ind3_r = zeros([x,y]);
    r_Ind3 = zeros([x,y]);
    r_Ind4_r = zeros([x,y]);
    r_Ind4x = zeros([x,y]);
    r_Ind4y = zeros([x,y]);
    r_Ind5_r = zeros([x,y]);
    r_Ind5 = zeros([x,y]);
    r_Ind6_r = zeros([x,y]);
    r_Ind6x = zeros([x,y]);
    r_Ind6y = zeros([x,y]);
    r_Ind7_r = zeros([x,y]);
    r_Ind7 = zeros([x,y]);
    r_Ind8_r = zeros([x,y]);
    r_Ind8x = zeros([x,y]);
    r_Ind8y = zeros([x,y]);
%     Zwei For Schleifen, um alle Werte der Matrizen durchzugehen.
%     Randpunkte werden ausgelassen
    for i=2:x-1
        for ii=2:y-1
%             Guckt wie der Normalenvektor steht. 1 ist Rechts mittig, es
%             geht gegen Uhrzeigersinn
            isEcke = false;
            if BK(i,ii) == 2  
                if BK(i-1,ii+1) == 0 && BK(i,ii+1) == 0 && BK(i-1,ii) == 0
                    RK(i,ii) = 2;
                    r_Ind2x(i-1,ii) = 1;
                    r_Ind2y(i,ii+1) = 1;
                    r_Ind2_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i-1,ii-1) == 0 && BK(i-1,ii) == 0 && BK(i,ii-1) == 0
                    RK(i,ii) = 4;
                    r_Ind4x(i-1,ii) = 1; 
                    r_Ind4y(i,ii-1) = 1; 
                    r_Ind4_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i+1,ii-1) == 0 && BK(i,ii-1) == 0 && BK(i+1,ii) == 0
                    RK(i,ii) = 6;
                    r_Ind6x(i+1,ii) = 1;  
                    r_Ind6y(i,ii-1) = 1;
                    r_Ind6_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i+1,ii+1) == 0 && BK(i,ii+1) == 0 && BK(i+1,ii) == 0
                    RK(i,ii) = 8;
                    r_Ind8x(i+1,ii) = 1;  
                    r_Ind8y(i,ii+1) = 1; 
                    r_Ind8_r(i,ii) = 1;
                    isEcke = true;
                
                elseif (BK(i,ii+1) == 0 && (BK(i-1,ii+1) == 0 || BK(i+1,ii+1) == 0)) && isEcke == false
                    RK(i,ii) = 1;
                    r_Ind1(i,ii+1) = 1; 
                    r_Ind1_r(i,ii) = 1;
                    
                elseif (BK(i-1,ii) == 0 && (BK(i-1,ii+1) == 0 || BK(i-1,ii-1) == 0)) && isEcke == false
                    RK(i,ii) = 3;
                    r_Ind3(i-1,ii) = 1;
                    r_Ind3_r(i,ii) = 1;
                
                elseif (BK(i,ii-1) == 0 && (BK(i-1,ii-1) == 0 || BK(i+1,ii-1) == 0)) && isEcke == false
                    RK(i,ii) = 5;
                    r_Ind5(i,ii-1) = 1;
                    r_Ind5_r(i,ii) = 1;
                
                elseif (BK(i+1,ii) == 0 && (BK(i+1,ii-1) == 0 || BK(i+1,ii+1) == 0)) && isEcke == false
                    RK(i,ii) = 7;
                    r_Ind7(i+1,ii) = 1;
                    r_Ind7_r(i,ii) = 1;
               
                end
            end
        end
    end
%     linker Rand
    for i1=2:x-1
        if BK(i1,2) == 0
            RK(i1,1) = 1;
            r_Ind1(i1,2) = 1;
            r_Ind1_r(i1,1) = 1;
        end
    end        
%   rechter Rand      
    for i5=2:x-1
        if BK(i5,y-1) == 0
            RK(i5,y)=5;
            r_Ind5(i5,y-1) = 1;
            r_Ind5_r(i5,y) = 1;
        end
    end
%     obere Rand
    for i3=2:y-1
        if BK(2,i3) == 0
            RK(1,i3) = 7;
            r_Ind7(2,i3) = 1;
            r_Ind7_r(1,i3) = 1;
        end
    end
%     untere Rand
    for i7=2:y-1
        if BK(x-1,i7) == 0
            RK(x,i7) = 3;
            r_Ind3(x-1,i7) = 1;
            r_Ind3_r(x,i7) = 1;
        end
    end
    
    %Erstellung Indexmatrizen abgeschlossen
    
    %Ueberpruefung, welcher Rand absorbierunt und welcher reflektiert, dazu
    %BK erneut auslesen. 
    %Werte in BK:
    %   1=absorbiert
    %   2=reflektiert
    %   3=Dirichlet