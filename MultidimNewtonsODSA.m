%% Newton's ODSA to be used in another opt. method as ODSA %%% func: Symbolic function% a: Lowerbound% b: Upperbound% e: Precision% p: Dummy parameter for convention% max_iter: Number of iterations% t: Equation of symbolic input% u: Symbolic inputfunction t = MultidimNewtonsODSA(func, a, b, e, p, max_iter, t, u)    init = (a+b)/2;    m = mat2cell(t,1,ones(1,numel(t)));    r = func(m{:});    z = matlabFunction(r,'vars', u);     x1 = init;    x2 = init;    df1 = Differentiate(z, u);    df2 = Differentiate(df1, u);    to = CalculateFunctions(df1, u, x1);    while to > e && i < max_iter        x2 = x1 - to/(CalculateFunctions(df2, u, x1));        to = CalculateFunctions(df1, u, x2);        x1 = x2;    end    t = x2;end%{Example usagesyms x y ef = @(x, y) 0.7*x^4 - 8*x^2 + 6*y^2 + cos(x*y) - 8*x;u = [e];o = [1 2] + e*[4 5];res = MultidimGoldenSectionSearch(f, -0.5, 0.5, 10^-5, 50, o, u);disp(res);%}