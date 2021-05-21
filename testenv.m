function testenv(inter, ic, h)
    n = (inter(2)-inter(1))/h;
    y(1,:) = ic;
    t(1) = inter(1)
    
    for k=1:n
        t(k+1) = t(k) + h;
        y(k+1,:) = eulerstep(t(k), y(k,:), h, @ydot);
    end
    disp(y.');
end


function z = ydot(t, y)
    z(1) = y(1) + y(2);
    z(2) = -y(1) + y(2);
end