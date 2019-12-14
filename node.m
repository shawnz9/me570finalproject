function [X Y]= node( X1,Y1,X2,Y2 )

% if X1(1)==Y1(1)
%     X=X1(1);
%     k2=(Y2(2)-X2(2))/(Y2(1)-X2(1));
%     b2=X2(2)-k2*X2(1); 
%     Y=k2*X+b2;
% end
% if X2(1)==Y2(1)
%     X=X2(1);
%     k1=(Y1(2)-X1(2))/(Y1(1)-X1(1));
%     b1=X1(2)-k1*X1(1);
%     Y=k1*X+b1;
% end
% if X1(1)~=Y1(1) & X2(1)~=Y2(1)
%     k1=(Y1(2)-X1(2))/(Y1(1)-X1(1));
%     k2=(Y2(2)-X2(2))/(Y2(1)-X2(1));
%     b1=X1(2)-k1*X1(1);
%     b2=X2(2)-k2*X2(1);
%     if k1==k2
%         X=[];
%         Y=[];
%     else
%         X=(b2-b1)/(k1-k2);
%         Y=k1*X+b1;
%    end
% end

x1=round(X1(1));
x2=round(X1(2));
x3=round(X2(1));
x4=round(X2(2));
y1=round(Y1(1));
y2=round(Y1(2));
y3=round(Y2(1));
y4=round(Y2(2));
if x1==x2
    X = x1;
        if x3==x4
            if abs(y3-y1) < abs(y4-y1)
                Y=y3;
            else
                Y=y4;
            end
        else
            k2 = (y3-y4)/(x3-x4);
            b2 = y3-k2*x3;
            Y = k2*X+b2;
        end
    return
end

if x3==x4
    X = x3;
    k1 = (y1-y2)/(x1-x2);
    b1 = y1-k1*x1;
    Y = k1*X+b1;
end

if x1~=x2 & x3~=x4
    k1 = (y1-y2)/(x1-x2);
    b1 = y1-k1*x1;
    k2 = (y3-y4)/(x3-x4);
    b2 = y3-k2*x3;
    if k1 == k2
        X=[];
        Y=[];
    else
        X = (b2-b1)/(k1-k2);
        Y = k1*X+b1;
    end
end
end

        