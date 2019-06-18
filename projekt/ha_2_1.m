%numerischer löser einer eindimensionalen Erhaltungsgleichung mithilfe des
%Erhaltungsschemas
clear

g=9.81;



CFL=0.9;
a=1;
f=@(x) ha_2_1_g(x);
dB=0;

l=0;
r=1;
N=100;
dx=(r-l)./N;

s=0;
e=5;
dt=CFL.*(dx./a);
T=floor((e-s)./dt);

U=zeros(N,T);
H=zeros(N,T);
F1=zeros(N,T);
F2=zeros(N,T);
F1h=zeros(N-1,T);
F2h=zeros(N-1,T);

x=linspace(l,r,N)';
U(:,1)=f(x(:,1));
H(:,1)=f(x(:,1));
x
f(x(:,1))
H(:,1)

n=1;
while n<=T-1
    F1(:,n)=H(:,n).*U(:,n);
    F2(:,n)=H(:,n).*U(:,n)+0.5.*g.*H(:,n);
    
    %Lax-Friedrich Flussfunktion
    F1h(:,n)=(dx./(2.*dt)).*(H(1:end-1,n)-H(2:end,n))...
        +0.5.*(F1(1:end-1,n)-F1(2:end,n));
    
    F2h(:,n)=(dx./(2.*dt)).*((U(1:end-1,n).*H(1:end-1,n))-(U(2:end,n).*H(2:end,n)))...
        +0.5.*(F2(1:end-1,n)-F2(2:end,n));
    
    %Erhaltungsschema
    %Gleichung 1
    H(2:end-1,n+1)=H(2:end-1,n)-(dt./dx).*(F1h(2:end,n)-F1h(1:end-1,n));
    
    %Gleichung 2
    U(2:end-1,n+1)=(U(2:end-1,n)-((dt./dx).*(F2h(2:end,n)-F2h(1:end-1,n)))-(dt.*g.*dB));
    for i=2:N-1
        U(i,n+1)=U(i,n+1).*(H(i,n)./H(i,n+1));
    end
    
    %Randbedingungen
    H(1,n+1)=  H(2,n+1);
    U(1,n+1)=  U(2,n+1);
    
    n=n+1;
end

%plotting
fig=figure(1);
for i=1:T
    if ~ishandle(fig)
        break
    end
    plot(x,H(:,i),'k')
    axis([l,r,min(H(:,1)),max(H(:,1))])
    drawnow
end