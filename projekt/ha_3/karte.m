%Erstellt Indexmatrizen für absorbierende Wände

function [Ind1_r,Ind1,Ind2_r,Ind2x,Ind2y,Ind3_r,Ind3,Ind4_r,Ind4x,Ind4y,Ind5_r,Ind5,Ind6_r,Ind6x,Ind6y,Ind7_r,Ind7,Ind8_r,Ind8x,Ind8y] = karte(BK)
% erkennt wie groß BK ist
    [x,y] = size(BK);
%     Erstellt alle Indexmatrizen
% r steht für richtig(also die Position, wo die Randzelle ist)
    RK = zeros([x,y]);
    Ind1_r = zeros([x,y]);
    Ind1 = zeros([x,y]);
    Ind2_r = zeros([x,y]);
    Ind2x = zeros([x,y]);
    Ind2y = zeros([x,y]);
    Ind3_r = zeros([x,y]);
    Ind3 = zeros([x,y]);
    Ind4_r = zeros([x,y]);
    Ind4x = zeros([x,y]);
    Ind4y = zeros([x,y]);
    Ind5_r = zeros([x,y]);
    Ind5 = zeros([x,y]);
    Ind6_r = zeros([x,y]);
    Ind6x = zeros([x,y]);
    Ind6y = zeros([x,y]);
    Ind7_r = zeros([x,y]);
    Ind7 = zeros([x,y]);
    Ind8_r = zeros([x,y]);
    Ind8x = zeros([x,y]);
    Ind8y = zeros([x,y]);
%     Zwei For Schleifen, um alle Werte der Matrizen durchzugehen.
%     Randpunkte werden ausgelassen
    for i=2:x-1
        for ii=2:y-1
%             Guckt wie der Normalenvektor steht. 1 ist Rechts mittig, es
%             geht gegen Uhrzeigersinn
            isEcke = false;
            if BK(i,ii) == 1  
                if BK(i-1,ii+1) == 0 && BK(i,ii+1) == 0 && BK(i-1,ii) == 0
                    RK(i,ii) = 2;
                    Ind2x(i-1,ii) = 1;
                    Ind2y(i,ii+1) = 1;
                    Ind2_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i-1,ii-1) == 0 && BK(i-1,ii) == 0 && BK(i,ii-1) == 0
                    RK(i,ii) = 4;
                    Ind4x(i-1,ii) = 1; 
                    Ind4y(i,ii-1) = 1; 
                    Ind4_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i+1,ii-1) == 0 && BK(i,ii-1) == 0 && BK(i+1,ii) == 0
                    RK(i,ii) = 6;
                    Ind6x(i+1,ii) = 1;  
                    Ind6y(i,ii-1) = 1;
                    Ind6_r(i,ii) = 1;
                    isEcke = true;
                    
                elseif BK(i+1,ii+1) == 0 && BK(i,ii+1) == 0 && BK(i+1,ii) == 0
                    RK(i,ii) = 8;
                    Ind8x(i+1,ii) = 1;  
                    Ind8y(i,ii+1) = 1; 
                    Ind8_r(i,ii) = 1;
                    isEcke = true;
                
                elseif (BK(i,ii+1) == 0 && (BK(i-1,ii+1) == 0 || BK(i+1,ii+1) == 0)) && isEcke == false
                    RK(i,ii) = 1;
                    Ind1(i,ii+1) = 1; 
                    Ind1_r(i,ii) = 1;
                    
                elseif (BK(i-1,ii) == 0 && (BK(i-1,ii+1) == 0 || BK(i-1,ii-1) == 0)) && isEcke == false
                    RK(i,ii) = 3;
                    Ind3(i-1,ii) = 1;
                    Ind3_r(i,ii) = 1;
                
                elseif (BK(i,ii-1) == 0 && (BK(i-1,ii-1) == 0 || BK(i+1,ii-1) == 0)) && isEcke == false
                    RK(i,ii) = 5;
                    Ind5(i,ii-1) = 1;
                    Ind5_r(i,ii) = 1;
                
                elseif (BK(i+1,ii) == 0 && (BK(i+1,ii-1) == 0 || BK(i+1,ii+1) == 0)) && isEcke == false
                    RK(i,ii) = 7;
                    Ind7(i+1,ii) = 1;
                    Ind7_r(i,ii) = 1;
               
                end
            end
        end
    end
%     linker Rand
    for i1=2:x-1
        if BK(i1,2) == 0 && BK(i1,1) == 1
            RK(i1,1) = 1;
            Ind1(i1,2) = 1;
            Ind1_r(i1,1) = 1;
        end
    end        
%   rechter Rand      
    for i5=2:x-1
        if BK(i5,y-1) == 0 && BK(i5,y) == 1
            RK(i5,y)=5;
            Ind5(i5,y-1) = 1;
            Ind5_r(i5,y) = 1;
        end
    end
%     obere Rand
    for i3=2:y-1
        if BK(2,i3) == 0 && BK(1,i3) == 1
            RK(1,i3) = 7;
            Ind7(2,i3) = 1;
            Ind7_r(1,i3) = 1;
        end
    end
%     untere Rand
    for i7=2:y-1
        if BK(x-1,i7) == 0 && BK(x,i7) == 1
            RK(x,i7) = 3;
            Ind3(x-1,i7) = 1;
            Ind3_r(x,i7) = 1;
        end
    end
    
%     Erstellen der logikmatrizen
    Ind1_r = logical(Ind1_r);
    Ind1 = logical(Ind1);
    Ind2_r = logical(Ind2_r);
    Ind2x = logical(Ind2x);
    Ind2y = logical(Ind2y);
    Ind3_r = logical(Ind3_r);
    Ind3 = logical(Ind3);
    Ind4_r = logical(Ind4_r);
    Ind4x = logical(Ind4x);
    Ind4y = logical(Ind4y);
    Ind5_r = logical(Ind5_r);
    Ind5 = logical(Ind5);
    Ind6_r = logical(Ind6_r);
    Ind6x = logical(Ind6x);
    Ind6y = logical(Ind6y);
    Ind7_r = logical(Ind7_r);
    Ind7 = logical(Ind7);
    Ind8_r = logical(Ind8_r);
    Ind8x = logical(Ind8x);
    Ind8y = logical(Ind8y);
    
    
    %Erstellung Indexmatrizen abgeschlossen
    
    %Ueberpruefung, welcher Rand absorbierunt und welcher reflektiert, dazu
    %BK erneut auslesen. 
    %Werte in BK:
    %   1=absorbiert
    %   2=reflektiert
    %   3=Dirichlet
    
    
    