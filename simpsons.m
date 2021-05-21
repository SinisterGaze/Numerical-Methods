function int = simpsons(f, a, b)
    int = (b-a)*(f(a) + 4*f((a+b)/2) + f(b))/6;
end