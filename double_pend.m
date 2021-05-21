function double_pend(inter, iv, n)
    h = (inter(2)-inter(1))/n;
    y(1,:) = iv;
    t(1) = inter(1);
    
    set(gca, 'xlim', [-2.2 2.2], 'ylim', [-2.2, 2.2], 'XTick', -2:2,...
        'YTick', -2:2, 'Visible', 'on', 'NextPlot', 'add');
    cla
    axis square;
    
    rod1 = line('color', 'b', 'LineStyle','-', 'LineWidth', 3, ...
        'xdata', [], 'ydata', []);
    rod2 = line('color', 'b', 'LineStyle','-', 'LineWidth', 3, ...
        'xdata', [], 'ydata', []);
    bob1 = line('color', 'r', 'Marker', '.', 'markersize', 40, ...
        'xdata', [], 'ydata', []);
    bob2 = line('color', 'r', 'Marker', '.', 'markersize', 40, ...
        'xdata', [], 'ydata', []);
    
    
    for k=1:n
        t(k+1) = t(k)+h;
        y(k+1,:) = RK4step(t(k), y(k,:), h, @ydot);
        
        xbob1 = sin(y(k+1, 1)); 
        ybob1 = -cos(y(k+1,1));
        xbob2 = xbob1 + sin(y(k+1, 3));
        ybob2 = ybob1 - cos(y(k+1, 3));
        
        xrod1 = [0 xbob1];
        yrod1 = [0 ybob1];
        xrod2 = [xbob1 xbob2];
        yrod2 = [ybob1 ybob2];
        
        set(rod1, 'xdata', xrod1, 'ydata', yrod1);
        set(rod2, 'xdata', xrod2, 'ydata', yrod2);
        set(bob1, 'xdata', xbob1, 'ydata', ybob1);
        set(bob2, 'xdata', xbob2, 'ydata', ybob2);
        
        drawnow expose;
        pause(h)
    end
    
end
        
function z = ydot(t, y)
    g = 9.81;
    L = [1 1];
    m  = [1 1];
    
    z(1) = y(2);
    z(2) = (-g * (2*m(1) + m(2))*sin(y(1)) - m(2)*g*sin(y(1)-2*y(3)) - 2*sin(y(1)-y(3)) *  (y(4)^2 * L(2) - y(2)^2 * L(1) * cos(y(1) - y(3)))) / (L(1) * (2 * m(1) + m(2) - m(2) * cos(2*y(1) - 2*y(3))));
    z(3) = y(4);
    z(4) = (2 * sin(y(1) - y(3)) * (y(2)^2 * L(1) * (m(1) +  m(2)) + g * (m(1) +  m(2)) * cos(y(1)) + y(4)^2 * L(2) * m(2) * cos(y(1) - y(3))) / (L(2) * (2 * m(1) + m(2) - m(2)  *  cos(2*y(1) - 2*y(3)))));
end            
    

