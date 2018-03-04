%% Fibonnaci Search with precomputed generator %%y = fibonacci(-0.5, 0.5, 2e-5, 1e-5, 20);disp(y);function y = f(x)    y = -5*x^5 + 4*x^4 - 12*x^3 + 11*x^2 - 2*x + 1;end%% Generates Fibonacci series %%function t = fibo_gen(r)    n(1) = 1;    n(2) = 1;    k = 3;     while k <= r        n(k) = n(k-1) + n(k-2);        k = k+1;    end    t = n;endfunction t = fibonacci(a,b,p,e,r)    n = fibo_gen(r);    i = 1;    a1 = a; b1 = b;        a2=0; b2=0; x2=0; y2=0;        x = (n(r-2)*1.0/n(r))*(b1 - a1);    y = (n(r-1)*1.0/n(r))*(b1 - a1);            while abs(b1-a1) > p       a2=a1; b2=b1;        x2=x; y2=y;                if(f(x) > f(y))          a1 = x;          x = y;          if i == (r-2)              break          end          y = (a1 + (n(r-i-1)*1.0/n(r-i)))*abs(b1-a1);       else            b1 = y;            y = x;            if i == r -2                break            end            x = (a1 + (n(r-i-2)*1.0/n(r-i)))*abs(b1-a1);       end       i = i + 1;    end    x = x2;    y = x2 + e;        if f(x)>f(y)        a1 = x;        b1 = b2;    else        a1 = a2;        b1 = y;    end    t = a1end