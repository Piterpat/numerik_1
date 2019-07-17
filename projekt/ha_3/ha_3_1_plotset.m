% plotten
Hplot=NaN(N,M);
fig=figure(1);
if bodenart ~= 0
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(B)) max(max(H))+2];
else
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(H))-0.5 max(max(H))+0.5];
end

caxis_set=[min(min(H)) max(max(H))+0.05];

if videoart ~= 0
    Frames=struct('cdata', cell(1, N), 'colormap', cell(1, N));
end