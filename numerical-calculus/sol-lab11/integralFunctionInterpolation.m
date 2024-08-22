% function (to be integrated)
g = @(x)(x.^2.*cos(x).*sin(x));
% interval of integration 
alfa = -pi/2; beta = pi/2;
% number of subintervals for integration  
m = 10;

% cavalieri-simpson formula
II = @(x)( (x(:,end)-0)/6/m.*( g(x(:,1)) + 2*sum(g(x(:,3:2:2*m)),2) + 4*sum(g(x(:,2:2:2*m)),2) + g(x(:,2*m+1))) );
% trapezius forlmula
%II = @(x)( (x(:,end)-0)./m.*( g(x(:,1)) + 2.*sum(g(x(2:end-1))) + g(x(:,end)) ) );

% valuation points
t = linspace(alfa,beta,100);
for k = 1:100
    
    % matrix of nodes -- at k-th row i have the k-th interval that i decompose for the numerical method 
    x(k,:) = linspace(0,t(k),2*m+1);
    
end

% plot function
figure(3)
plot(t,II(x),'k')
hold on
pause

fprintf('\n')
disp([' number of nodes ',' ||s-f||_inf'])

for n=4:2:8
    
    xx = linspace(alfa,beta,n+1);
    % evaluate integral function 
    for k = 1:n+1, xI = linspace(0,xx(k),2*m+1); y(k) = II(xI);end
    % compute spline
    s = spline(xx(:),y(:),t);
    % compute error
    disp([n,max(abs(s(:)-II(x)))])
    plot(t,s)
    hold on 
    pause
    
end

hold off
xlabel('x')
ylabel('y')
title('polynomial interpolation of an integral function')
legend('f','s, n=4', 's, n=6', 's, n=8')



