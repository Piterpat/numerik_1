function [B,Ind1,Ind2,Ind3,Ind4,Ind5,Ind6,Ind7,Ind8] = karte(K)
    [x,y] = size(K);
    B = zeros([x,y]);
    Ind1 = zeros([x,y]);
    Ind2 = zeros([x,y]);
    Ind3 = zeros([x,y]);
    Ind4 = zeros([x,y]);
    Ind5 = zeros([x,y]);
    Ind6 = zeros([x,y]);
    Ind7 = zeros([x,y]);
    Ind8 = zeros([x,y]);
    for i=2:x
        for ii=2:y
            if K(i,ii) ~= 0
                if K(i,ii+1) == 0
                    B(i,ii) = 1;
                    Ind1(i,ii+1) = 1;                        
                elseif K(i-1,ii+1) == 0
                    B(i,ii) = 2;
                    Ind2(i-1,ii+1) = 1;
                elseif K(i-1,ii) == 0
                    B(i,ii) = 3;
                    Ind3(i-1,ii) = 1;
                elseif K(i-1,ii-1) == 0
                    B(i,ii) = 4;
                    Ind4(i-1,ii-1) = 1;  
                elseif K(i,ii-1) == 0
                    B(i,ii) = 5;
                    Ind5(i,ii-1) = 1; 
                elseif K(i+1,ii-1) == 0
                    B(i,ii) = 6;
                    Ind6(i+1,ii-1) = 1;  
                elseif K(i+1,ii) == 0
                    B(i,ii) = 7;
                    Ind7(i+1,ii) = 1;
                elseif K(i+1,ii+1) == 0
                    B(i,ii) = 8;
                    Ind1(i+1,ii) = 1;  
                end
            end
        end
    end
    
    for i1=2:x
        if K(i1,y-1) == 0
            B(i1,y) = 1;
            Ind1(i1,y-1) = 1;
        end
    end        
        
    for i5=2:x
        if K(i5,2) == 0
            B(i5,1)=5;
            Ind5(i5,2) = 1;
        end
    end
    
    for i3=2:y
        if K(2,i3) == 0
            B(1,i3) = 3;
            Ind3(2,i3) = 1;
        end
    end
    
    for i7=2:y
        if K(x-1,i7) == 0
            B(x,i7) = 7;
            Ind7(x-1,i7) = 1;
        end
    end