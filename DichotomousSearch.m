%% Dichotomous Search %%y = dicho(-0.5, 0.5, 2*10^-5, 10^-5, 100);disp(y);function y = f(x)    y = -5*x^5 + 4*x^4 - 12*x^3 + 11*x^2 - 2*x + 1;endfunction t = dicho(a, b, p, e, iter)    i = 1;    a1 = a;    b1 = b;    while abs(b1-a1) > p && i < iter       x = ((a1+b1)/2) - e;       y = ((a1+b1)/2) + e ;              if(f(x) < f(y))          b1 = y;       else          a1 = x;       end       i = i + 1;       p = (b-a)/(2^i) + 2*e*(1 - (1/2^i));    end    t = (a1+b1)/2;    end