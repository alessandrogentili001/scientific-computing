function I2m = CavalieriSimpsonComposite(a,b,m,fun)
% implement the composite cavalieri-simpson formula for approximating
% integrals 

% a,b: extremal domains 
%   m: number of subintervals
% fun: function to be integrated  

% split each subinterval 
H = (b-a)/m; % leangth of subinterval
x = (a:H/2:b); % decompose domain 
I2m = (H./6)*(fun(a) + fun(b) + 4*sum(fun(x(2:2:length(x)-1))) + 2*sum(fun(x(3:2:length(x)-2)))); % formula 





