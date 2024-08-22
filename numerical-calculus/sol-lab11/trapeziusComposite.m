function I1m = trapeziusComposite(a,b,m,fun)
% implement the composite trapezious formula for approximating integrals

% a,b: extremal domain 
%   m: number of subintervals 
% fun: function to be integrated 

if a == b
    
    I1m = 0;
    
else
    
    H = (b-a)/m; % length of subinterval
    x = (a:H:b); % decompose domain
    I1m = H*((fun(x(1)) + fun(x(m+1)))/2 + sum(fun(x(2:m)))); % formula
    
end 
