function y = eulerstep(t, x, h, ydot)
    y = x + h*ydot(t,x);
end

