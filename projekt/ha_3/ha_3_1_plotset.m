% plotten
Hplot=NaN(N,M);
fig=figure(1);
if bodenflag == 1
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(B)) max(max(H))+2];
else
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(H))-2 max(max(H))+2];
end
% axis_set=[min(x) max(x)...
%         min(y) max(x)...
%         2 8];
caxis_set=[min(min(H)) max(max(H))+0.05];

xlabel('X')
ylabel('Y')