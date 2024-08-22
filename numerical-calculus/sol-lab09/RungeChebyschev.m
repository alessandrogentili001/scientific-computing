fprintf('runge with Chebycehv nodes\n')

% runge function and domain
f = @(x)(1./(1+x.^2));
alfa=-5; beta=5;

% plot function
figure(1)
fplot(f,[alfa,beta],'r--')
hold on
xlabel('valori di x')
ylabel('valori della funzione')
title('funzione di runge')
pause

i = 1;
for n=5:5:15
    
    % Chebyschev nodes 
    xcap = cos((2*(0:n)+1)./(2*n+2)*pi)';
    x = (alfa+beta)./2 + ((alfa-beta)./2).*xcap; y = f(x); % guardere il grafico e vedere come sono messi
    plot(x,y,'*')
    pause
    
    % compute polynomial coefficients
    a = getPolynCoeff(x,y);
    
    % compute polynomial values
    t = linspace(alfa,beta,100);
    yp = polyval(a,t);
    plot(t,yp,'k')
    pause
    
    % compute approximation erorr
    N(i,1) = n+1;
    E(i,1) = max(abs(f(t)-yp));
    i = i+1;
    
end

disp('    #nodes     error')
disp([N,E])

% The function is well approximated by the interpolating polynomials at
% the Chebyshev nodes, in the sense that the error decreases as the number 
% of nodes increases







