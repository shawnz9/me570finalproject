# me570finalproject
This is the simulation of our final project. This Matlab code is used to simulate the not-2-searchable room searching process mentioned in our paper. At the bottom of the room is a door.Red dot represents a searcher, a green dot means guard, and a blue dot is a evader. The evader is going to flee out from the room through the door while the pursuers are going to catch the evader before it escaping. However, because the evader path planning is a very large workload, in order to simplify the process, we set the evader action to move randomly, and after being discovered by the pursuer flee in the opposite direction.\
\
To run the simulation, simply run the code "searcher_animate" in the file.\
\
Please be aware that MATLAB mapping toolbox is requred for running this code, since we used the function linecirc. When the searcher_animate is runnning, there would be an error if the toolbox has not benn installed yet. 
