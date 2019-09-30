% plotten
Hplot=NaN(N,M);
Bplot=NaN(N,M);
Splot=NaN(N,M);
fig=figure(1);

if bodenart~=0
    Bplot(BER)=B(BER);

    axis_set_H=[min(x) max(x)...
    min(y) max(x)...
    min(min(B)) max(max(H+B))+2];
else
    axis_set_H=[l r...
    u o...
    min(min(H)-2) max(max(H))+2];

end

caxis_set_H=[min(min(H)-0.01) max(max(H))+0.01];


if schadstoffart~=0
    axis_set_S=[l r...
    u o...
    min(min(S)-2) max(max(S))+2];

    caxis_set_S=[min(min(S)-0.01) max(max(S))+0.01];
end

if videoart ~= 0
%     nframes=50;
%     Frames=moviein(nframes);
    v = VideoWriter(videoname+".avi");
    open(v)
    ax = fig;
end
