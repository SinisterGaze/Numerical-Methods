function int = simpsons_AQ(f, a, b, TOL)
    c = 0.5*(a+b);
    app1 = simpsons(f, a, b);
    app2 = simpsons(f, a, c) + simpsons(f, c, b);
    if abs(app1 - app2) < 15 * TOL
        int = app2;
    else
        int = simpsons_AQ(f, a, c, 0.5*TOL) + simpsons_AQ(f, c, b, 0.5*TOL);
    end
end




