function [lionPosition] = lion(pursuer,evader,center)
data = load('FreeSpace_data_R1.mat');
graphVector = data.graphVector;
coeff = polyfit([center(1),evader(1)],[center(2),evader(2)],1);
[xout,yout] = linecirc(coeff(1),coeff(2),pursuer(1),pursuer(2),sqrt(2));
pointa = [xout(1);yout(1)];
pointb = [xout(2);yout(2)];
if norm(pointa-evader) < norm(pointb-evader)
    lionPosition = pointa;
else
    lionPosition = pointb;
end
lionIndex = graph_coortoindex(data.graphVector,lionPosition);
lionPosition = graphVector(lionIndex).x;
