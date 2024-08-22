fprintf('approximate a function using least square problem')

% fiunction and domain
f = @(x)(x.^2.*sin(x).*cos(x)); 
alfa = -pi; beta = pi;

% plot function
figure(1)
title('approximation using least squares')
xlabel('x')
ylabel('y')
fplot(f,[alfa,beta],'r--'); 
hold on
pause

% loop over the number of nodes 
for n=6:4:14
    
    % define interpolation nodes 
    x=linspace(alfa,beta,n+1)'; 
    plot(x,f(x),'*') 
    pause
    
    % polynomial grade
    m = n-2; 
    
    % compute polynomial coefficients using least square 
    a = getPolynCoeffLeastSquare(m,x,f(x));
    
    % plot the polynom
    t = linspace(alfa,beta,100); 
    yp = polyval(a,t); 
    plot(t,yp); 
    pause
    
    % compute the approximation error
    E = max(abs(f(t)-yp)); 
    disp('    #nodes     error')
    disp([n+1,E])
    
end