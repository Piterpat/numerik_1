% plotten
Hplot=NaN(N,M);
fig=figure(1);
if bodenart ~= 0
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(B)) max(max(H+B))+2];
else
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(H))-2 max(max(H))+2];
end

caxis_set=[min(min(H)) max(max(H))+1];

if videoart ~= 0
    Frames=struct('cdata', cell(1, N), 'colormap', cell(1, N));
end