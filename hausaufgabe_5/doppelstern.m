%MATLAB-Funktion doppelstern(m1,m2,x1,x2,p,h) welche die Differentialgleichung (?) mit Hilfe des klassischen Runge-Kutta-Verfahrens l¨ost und einen Film erzeugt, der die Bewegung der Massen zeigt

function doppelstern(M1,M2,x1,x2,p,h)

    global gamma
    global m1
    global m2

    m2=M2;
    m1=M1;
    gamma=1;

    v1=[0; p/m1];
    v2=[0; -p/m2];
    y=[x1; x2; v1; v2];
    y_neu=y;
    h1 = animatedline;
    h2 = animatedline;
    axis equal
    while true
        addpoints(h1,y_neu(1),y_neu(2))
        addpoints(h2,y_neu(3),y_neu(4))
        drawnow limitrate
        y_neu=ruku_schritt(@gravi,y_neu,h);
        %pause(0.01)
    end
end