%Funktion, die DGLS mit beliebiger rechter Seite f mit dem klassischem RungeKutte Verafhren und der Schrittweite h ausführt

function y_neu=ruku_schritt(gravi,y,h)

    k1=gravi(y);
    k2=gravi(y+(h./2).*k1);
    k3=gravi(y+(h./2).*k2);
    k4=gravi(y+h.*k3);
    y_neu=y+h.*((k1./6)+(k2./3)+(k3./3)+(k4./6));

end