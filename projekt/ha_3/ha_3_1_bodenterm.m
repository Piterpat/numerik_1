dBy=zeros(N,M);
dBx=zeros(N,M);
% 
% dBx(2:end-1,2:end-1)=(B(3:end,2:end-1)-B(1:end-2,2:end-1))./(2.*dx);
% dBy(2:end-1,2:end-1)=(B(2:end-1,3:end)-B(2:end-1,1:end-2))./(2.*dy);