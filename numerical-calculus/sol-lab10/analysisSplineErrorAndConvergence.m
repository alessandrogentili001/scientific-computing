fprintf('analysis of spline interpolation and convergence speed \n')

format short

% runge function
f = @(x)(1./(1+x.^2));
alfa = -5; beta = 5;

% plot function
figure(1)
fplot(f,[alfa,beta],'r--')
hold on
xlabel('x')
ylabel('y')
title('spline not-a-knot for runge function')

% l = 3; % degree
% p = l+1; % coeff for convergence speed

disp('    error       h       p')

err_old = 1;

% loop over the number of subintervals
for k = 1:6
    
    % decompose the interval
    h = (1/2)^k; % length of subintervals
    n = (beta-alfa)/h; % number of subintervals
    x = linspace(alfa,beta,n+1)'; y = f(x); 
    
    % valuation points and compute the spline 
    t = linspace(alfa,beta,1000)';
    s = spline(x,y,t);
    
    % plot spline
    plot(t,s)
    hold on
    
    % compute the error
    err = max(abs(f(t)-s));
    p = log2(err_old/err);
    disp([err,h,p]) % verify p --> l+1 for h --> 0
    err_old = err;
    
end

%--------------------------------------------------------------------

fprintf('approx a function and its derivatives with splines\n')

% number of nodes 
n = 13; 
x = linspace(alfa,beta,n); y = f(x); 

% spline 
S = spline(x,y); % contains the 'structure'

%      form: 'pp'
%    breaks: [-5 -4 -3 -2 -1 0 1 2 3 4 5]
%     coefs: [12×4 double]
%    pieces: 12
%     order: 4
%       dim: 1

rho = S.coefs; % matrix (n)x(l+1) of coeffs that build the complete spline 

% evaluation point
z = linspace(alfa,beta,1000); 

drho = [3*rho(:,1), 2*rho(:,2), rho(:,3)]; % first derivative 
d2rho = [2*drho(:,1), drho(:,2)]; % seconod derivative  
d3rho = [d2rho(:,1)]; % third derivative

% evaluate spline
Sval = ppval(S,z); 

dS = mkpp(x,drho); % build first derivative spline 
dSval = ppval(dS,z); % evaluate first derivative spline 

d2S = mkpp(x,d2rho); % buils second derivative spline 
d2Sval = ppval(d2S,z); % evaluate second derivative spline 

d3S = mkpp(x,d3rho); % build third derivative spline 
d3Sval = ppval(d3S,z); % evaluate third derivative spline

% compute derivatives of f
f1 =  @(x)(-2.*x./(1+x.^2).^2); % first derivative
f2 =  @(x)((6.*(x.^2)-2)./(1+x.^2).^3); % second derivative  
f3 =  @(x)((24.*x - 36.*(x.^2))./(1+x.^2).^4); % third derivative

i = [alfa,beta];

figure(2)
title('runge function')
fplot(f,i,'r--')
hold on
plot(z,Sval,'y')
legend('f','S')

figure(3)
title('first derivative')
fplot(f1,i,'r--')
hold on
plot(z,dSval,'y')
legend('f^1','S^1')

figure(4)
title('second derivative')
fplot(f2,i,'r--')
hold on
plot(z,d2Sval,'y')
legend('f^2','S^2')

figure(5)
title('third derivative')
fplot(f3,i,'r--')
hold on
plot(z,d3Sval,'y')
legend('f^3','S^3')

% ----------------------------------------------------------------------

fprintf('analysis spline error and convergence speed\n')

% l = 3 % degree
% p = l+1

disp('       h        err        p        err1      p1       err2       p2')

err_old = 1;
err1_old = 1;
err2_old = 1;

for k = 1:6
    
    % decompose the interval
    h = (1/2)^k; % lenght of intervals
    n = (beta-alfa)/h; % number of intervals
    x = linspace(alfa,beta,n+1)'; y = f(x);
    
    % compute the structure of the spline and its derivatives
    S = spline(x,y);
    rho = S.coefs; 
    drho = [3*rho(:,1), 2*rho(:,2), rho(:,3)]; % first derivativs
    d2rho = [6*rho(:,1), 2*rho(:,2)]; % second derivatives 
    
    % evaluate spline
    Sval = ppval(S,z); 

    dS = mkpp(x,drho); % build first derivative spline
    dSval = ppval(dS,z); % evaluate first derivative spline
    
    d2S = mkpp(x,d2rho); % build second derivative spline
    d2Sval = ppval(d2S,z); % evaluate second derivative spline
    
    % compute error
    err = max(abs(f(z)-Sval));
    p = log2(err_old/err);
    err1 = max(abs(f1(z)-dSval));
    p1 = log2(err1_old/err1);
    err2 = max(abs(f2(z)-d2Sval));
    p2 = log2(err2_old/err2);
    
    % show convergence
    disp([h,err,p,err1,p1,err2,p2]) 

    err_old = err;
    err1_old = err1;
    err2_old = err2;
    
end

