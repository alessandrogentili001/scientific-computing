fprintf('approximate function using polynomial interpolation\n')

% function and domain
f = @(x)(x.^2.*sin(x).*cos(x)); % define a function (vertical vector only)
alfa = -pi; beta = pi; % extremal domain 

% plot function
figure(1)
fplot(f,[alfa,beta],'r--'); 
hold on
title('polynomial interpolation')
xlabel('x')
ylabel('y')
pause

% loop along the numbner of nodes for the interpolation
for n=6:4:14
    
    % compute nodes 
    x = linspace(alfa,beta,n+1)'; 
    plot(x,f(x),'*') 
    pause
    
    % compute coeffs of the interpoling polynom
    a = getPolynCoeff(x,f(x)); 
    
    % point for plotting the polynom
    t = linspace(alfa,beta,100); 
    yp = polyval(a,t); 
    plot(t,yp);
    pause
    
    % comoute the approximation error (infinite norm)
    E = max(abs(f(t)-yp)); 
    disp('    #nodes     error')
    disp([n+1,E])
    
end

