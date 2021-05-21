function y = trapstep(t, x, h, ydot)
    z1 = ydot(t,x);
    z2 = ydot(t+h, x + h*z1);
    y = x + h * (z1 + z2)/2;
end

