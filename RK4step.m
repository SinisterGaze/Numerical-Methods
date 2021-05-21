function y = RK4step(t, x, h, ydot)
    s1 = ydot(t, x);
    s2 = ydot(t + 0.5*h, x + 0.5*h*s1);
    s3 = ydot(t + 0.5*h, x + 0.5*h*s2);
    s4 = ydot(t + h, x + h * s3);
    y = x + (h/6) * (s1 + 2*s2 + 2*s3 + s4);
end

