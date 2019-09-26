function [z,h] = dammbruch_tester(t)
% t = 0.00000001;
x0 = 0.5;
h_L = 1;
h_R = 0.5;
S_w = 2.9575;
h1 = animatedline;
h2 = animatedline;
N = 100;
% [h,u] = dammbruch(xt,x0,h_L,h_R,S_w);
% h
% u

% Für das Video
up=1.5;
low=0;
n = 1;

% ----------------------------------------------------------
%    for t=0:0.001:0.2
%       t = 0.1;
      h = zeros(100,1);
      z = linspace(0,1,100);
   for i=1:100
         x = z(i);
         [h(i),u] = dammbruch(x,t,x0,h_L,h_R,S_w);
         %subplot(2,1,1);
         %addpoints(h1,x,h)
         %drawnow limitrate
         %pause(0.01)
         %subplot(2,1,2);
         %addpoints(h2, t,u)
   end
    plot(z,h)
%     axis equal;
    axis([0,1,low,up])
    axis square
    xlabel('Y')
    ylabel('Höhe')
%     drawnow
%     if t == 0
%         Frames=struct('cdata', cell(1, N), 'colormap', cell(1, N));
%         fig=figure(1);
%     end
%     
%     
%     Frames(n) = getframe(gcf);
%     pause(0.01)
%     n= n+1;
%    end
%    ha_2_1_ana_video
 