function initialConditions()
fps = 1/60;
door = [50;1];
searcheranglePrev = [pi,0];
guardanglePrev = [pi,0];
angleflag = [0,0];
searcherpreflag=[NaN,NaN];
guardpreflag = [NaN,NaN];
searcherleftenpointPrev = [30;1];
searcherrightenpointPrev = [69;1];
swipeflagl = 0;
swipeflagr = 0;
guardswipeflagl = 0;
guardswipeflagr = 0;
plot_info_1 = NaN;
plot_info_2 = NaN;
evaderspreflag = [NaN,NaN];
evadergpreflag = [NaN,NaN];
save InitialConditions.mat