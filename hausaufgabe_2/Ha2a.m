% Statt n muss eine Zahl eingegeben werden
format long
n = 12;
T = zeros(n,6);
for i=2:n+1
%     erster Eintrag
    T(i-1,1) = i;
%     zweiter Eintrag
    T(i-1,2) = (cond(hilb(i),inf) .* 10e-18);
%     dritter Eintrag
    A = hilb(i);
    b = A(:,1) + A(:,i);
    x = zeros(i-1,1);
    x(1,1) = 1;
    x(i,1) = 1;
    x_bs = A\b;
    T(i-1,3) = (norm(x-x_bs,inf))./ norm(x,inf);
%     vierter Eintrag
    [L,R,P] = lu(A);
    y_lr = L\(P*b);
    x_lr = R\y_lr;
    T(i-1,4) = (norm(x-x_lr,inf))./ norm(x,inf);
%     f�nfter Eintrag
    R = chol(A);
    y_ch = R.'\b;
    x_ch = R\y_ch;
    T(i-1,5) = (norm(x-x_ch,inf))./ norm(x,inf);
%     sechster Eintrag
    T(i-1,6) = norm(((A * x_ch) - b),inf);
end
