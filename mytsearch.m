function [t] = mytsearch(x,y,tri,X,Y)
%triangulation


t = NaN(size(X));

for j = 1:size(tri,1),
    a = tri(j,1);
    b = tri(j,2);
    c = tri(j,3);
    d1 = ((x(b)-x(a)).*(y(c)-y(a)) - (y(b)-y(a)).*(x(c)-x(a)));
    d2 = ((x(c)-x(b)).*(y(a)-y(b)) - (y(c)-y(b)).*(x(a)-x(b)));
    d3 = ((x(a)-x(c)).*(y(b)-y(c)) - (y(a)-y(c)).*(x(b)-x(c)));
    xba = x(b)-x(a); xcb = x(c)-x(b); xac = x(a)-x(c);
    yba = y(b)-y(a); ycb = y(c)-y(b); yac = y(a)-y(c);
    for i = 1:numel(t),
        if t(i)>0, continue; end
        if (xba*(Y(i)-y(a)) - yba*(X(i)-x(a))) * d1 < 0, continue; end
        if (xcb*(Y(i)-y(b)) - ycb*(X(i)-x(b))) * d2 < 0, continue; end
        if (xac*(Y(i)-y(c)) - yac*(X(i)-x(c))) * d3 < 0, continue; end
        t(i) = j;
    end
end