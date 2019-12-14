function [blacklist] = cutboundryblacklist
load FreeSpace_data_R1.mat
xAll=[graphVector.x];
blacklist = [];
for i=1:length(xAll)
    graphVector(i).x
    if graphVector(i).x(1) < 10
        if graphVector(i).x(1) == 1 || graphVector(i).x(1) == 9
            blacklist = [blacklist,i];
            continue
        end
        if graphVector(i).x(2) == 35 || graphVector(i).x(1) == 65
            blacklist = [blacklist,i];
        end
    elseif graphVector(i).x(1) > 90
        if graphVector(i).x(1) == 91 || graphVector(i).x(1) == 100
            blacklist = [blacklist,i];
            continue
        end
        if graphVector(i).x(2) == 26 || graphVector(i).x(1) == 55
            blacklist = [blacklist,i];
        end
    end
end

    