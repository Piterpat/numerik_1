%Gravitationsfunktion

function f=gravi(y)

    global gamma
    global m1
    global m2

    F= (gamma.*m1.*m2)./(norm(y(3:4,1)-y(1:2,1)).^3)*(y(3:4,1)-y(1:2,1));
    f=[y(5:6,1);y(7:8,1);F./m1;-F./m2];

end