fprintf('runge with equispaced nodes\n')

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

for n=4:2:10
    
    % equispaced nodes 
    x = linspace(alfa,beta,n+1)'; y=f(x);
    plot(x,y,'*')
    pause
    
    % compute polynomial coefficient  
    a = getPolynCoeff(x,y);
    
    % compute polynomial values 
    t = linspace(alfa,beta,100);
    yp = polyval(a,t);
    plot(t,yp,'k')
    pause
    
    % compute approximation error
    E(i,1)=max(abs(f(t)-yp));
    N(i,1) = n+1; 
    i = i+1;
    
end

disp('    #nodes     error')
disp([N,E])

% the approximation error growth if number of nodes growth
