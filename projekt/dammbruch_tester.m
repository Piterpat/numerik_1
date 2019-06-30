% t = 0.00000001;
x0 = 0.5;
h_L = 1;
h_R = 0.5;
S_w = 2.9575;
h1 = animatedline;
h2 = animatedline;
axis equal
% [h,u] = dammbruch(xt,x0,h_L,h_R,S_w);
% h
% u
  for t=0:0.001:0.5
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
    axis equal;
    
    pause(0.1)
  end
 