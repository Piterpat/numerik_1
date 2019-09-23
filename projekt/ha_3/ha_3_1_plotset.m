% plotten
Hplot=NaN(N,M);
Splot=NaN(N,M);
fig=figure(1);
if bodenart ~= 0
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(B)) max(max(H+B))+2];

    caxis_set=[min(min(H)) max(max(H))+1];
elseif schadstoffart ~= 0
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(S)-2) max(max(S))+2];

caxis_set=[min(min(S)) max(max(S))+1];
else
    axis_set=[min(x) max(x)...
    min(y) max(x)...
    min(min(H))-2 max(max(H))+2];

caxis_set=[min(min(H)) max(max(H))+1];
end


if videoart ~= 0
    Frames=struct('cdata', cell(1, N), 'colormap', cell(1, N));
end