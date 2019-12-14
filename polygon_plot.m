%function polygon_plot(vertices,style)
%Draws a closed polygon described by  vertices using the style (e.g., color)
%given by  style.
function polygon_plot(vertices,style)

x = vertices(1,:); %Setting the first row to be x 
y = vertices(2,:); %Settung the second row to be y
u = zeros(size(x)); %set the initial u to be an empty array
v = zeros(size(y)); %set the initial v to be an empty array

times=length(x); % calculate the number of elements for each row of the vertices array


m=1; % setting m = 1 in order to keep in track of the element

for i = 1:times % This loop is to calculate the difference vectors between two adjacent points
    next=mod(m,times)+1; % Moving to the next point
    u(i) = x(next)-x(m); % Adding the element in x direction in the u array 
    v(i) = y(next)-y(m);% Adding the element in y direction in the v array
    m=m+1;%Moving to the next element.
end

quiver(x,y,u,v,0,style)%draw the polygon.
hold on


    
%Setting the arrays for corrdinates of points in the polygon.
%Calculating vectors for each side of the polygon

%Each edge in the polygon must be an arrow pointing from one vertex to the next.
%In Matlab, use the function quiver to actually perform the drawing. The function
%should  not create a new figure.
