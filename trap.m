function int = trap(f, a, b)
    int = (b-a)*(f(a) + f(b)) * 0.5;
end