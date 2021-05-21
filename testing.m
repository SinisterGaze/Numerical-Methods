f = @(x) (x/(sqrt(x^2 + 9)));
TOL = 0.5e-8;
a = 0;
b = 4;

n = 100;

T1 = zeros(1, n);
T2 = zeros(1, n);

for i = 1:n
    tic;
    trap_AQ(f, a, b, TOL);
    T1(i) = toc;
    
    tic;
    simpsons_AQ(f, a, b, TOL);
    T2(i) = toc;
end

disp(mean(T1));
disp(mean(T2));

disp(mean(T1)/mean(T2));

    