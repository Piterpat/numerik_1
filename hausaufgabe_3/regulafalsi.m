%Funktion, die bei gegebener Funktion in einem Intervall mit dem Regulafalsi-Verfahren nach einer
%Nullstelle sucht, sofern a und b verschiedene Vorzeichen besitzen.
%Die Lösung wird ausgegeben, sobald das Erg

function [x]=regulafalsi(f,a,b,tol)
    if f(a) > 0 && f(b) > 0
        disp('Intervallgrenzen beide positiv, regulaflasi kann nicht angewandt werden')
    end
    if f(a) < 0 && f(b) < 0
        disp('Intervallgrenzen beide negativ, regulaflasi kann nicht angewandt werden')
    end
    
    x_temp=a;
    x=b;
    abstand=abs(x-x_temp);
    
    if f(a) < 0 && f(b) > 0
        while abstand > tol
            x = (a.*f(b)-b.*f(a))/(f(b)-f(a));
            if f(x)>0
                b=x;
            end
            if f(x)<0
                a=x;
            end
            abstand=abs(x-x_temp);
            x_temp=x;
        end
    end
    
    
    if f(a) > 0 && f(b) < 0
        while abstand > tol
            x = (a.*f(b)-b.*f(a))/(f(b)-f(a));
            if f(x)>0
                a=x;
            end
            if f(x)<0
                b=x;
            end
            abstand=abs(x-x_temp);
            x_temp=x;
        end
    end
end