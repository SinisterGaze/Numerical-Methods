function pend(inter, iv, n)
    h = (inter(2)-inter(1))/n;
    y(1,:) = iv;
    t(1) = inter(1);
    
    set(gca, 'xlim', [-1.2 1.2], 'ylim', [-1.2, 1.2], 'XTick', [-1, 0, 1],...
        'YTick', [-1 0 1], 'Visible', 'on', 'NextPlot', 'add');
    
    cla;
    axis square;
    
    bob = line('color', 'r', 'Marker', '.', 'markersize', 40, ...
        'xdata', [], 'ydata', []);
    rod = line('color', 'b', 'LineStyle','-', 'LineWidth', 3, ...
        'xdata', [], 'ydata', []);
    
    for k=1:n
        t(k+1) = t(k)+h;
        y(k+1,:) = trapstep(t(k), y(k,:), h, @ydot);
        
        xbob = sin(y(k+1,1)); ybob = -cos(y(k+1,1));
        xrod = [0 xbob]; yrod = [0 ybob];
        
        set(rod, 'xdata', xrod, 'ydata', yrod);
        set(bob, 'xdata', xbob, 'ydata', ybob);
        
        drawnow expose;
        pause(h)
    end
end
        
function z = ydot(t, y)
    g = 9.81;
    length=1;
    d = 0;
    A = 0;
    z(1) = y(2);
    z(2) = -(g/length) * sin(y(1)) - d*y(2) + A*sin(t);
end            
    

