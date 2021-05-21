function int = trap_AQ(f, a, b, TOL)
    c = 0.5*(a+b);
    app1 = trap(f, a, b);
    app2 = trap(f, a, c) + trap(f, c, b);
    if abs(app1 - app2) < 3 * TOL
        int = app2;
    else
        int = trap_AQ(f, a, c, 0.5*TOL) + trap_AQ(f, c, b, 0.5*TOL);
    end
end




