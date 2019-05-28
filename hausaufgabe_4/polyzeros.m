function z = polyzeros(a)
    a_strich = polyder (a);
    [~,b] = size(a);
    z = zeros(1,b-1);
    
    
%     ersten Wert hartcoden mit Newton ohne Nullstellen!
    z_k = rand;
    tol = 1*10.^-5;
    Abstand = tol +1;
    
    while Abstand > tol
    z_ktemp = z_k - (polyval(a,z_k)/polyval(a_strich,z_k)); 
    Abstand = abs (z_k - z_ktemp);
    z_k = z_ktemp;
    end
    z(1) = z_k;
    
    
%     Newton Verfahren mit schon bekannten Nullstellen 
    
    for ii=2:b-1
        x_k = rand;
        abstand2 = tol + 1;
        while abstand2 > tol
            p_x = polyval(a,x_k);
            p_strich_x = polyval (a_strich,x_k);
    %         q/q' ermitteln
            q = 0;
                for iii=1:ii-1
                    q = q - (1/(x_k - z(iii)));
                end

    %         newton formel mit bekannten Nullstellen
            x_temp = x_k -(1/((p_strich_x/p_x) + q));
            abstand2 = abs(x_k - x_temp);
            x_k = x_temp;
            
        end
        z(ii)= x_k;
        
%         Korrektur der Nullstellen
        abstand3 = tol + 1;
        m_k = z(ii);
        while abstand3 > tol
            m_ktemp = m_k - (polyval(a,m_k)/polyval(a_strich,m_k));
            abstand3 = abs(m_k) - abs(m_ktemp);
            m_k = m_ktemp;
        end
        z(ii)=m_k;
         
    end
    
    


end