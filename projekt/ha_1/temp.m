EOC=(log(norm(losung2(:,end)-upwind2(:,end),inf))...
    -log(norm(losung1(:,end)-upwind1(:,end),inf)))...
    /(log(dx2)-log(dx1));