fprintf('composite polynnomial interpolation of humps function\n')

% humps function
f = @(x)(1./((x-3/10).^2 + 1/100) + 1./((x-9/10).^2 + 4/100) - 6);
alfa = 0; beta = 2;

% plot funciton
figure(1)
title('composite polynomial interpolation')
fplot(f,[alfa,beta],'r')
xlabel('x')
ylabel('y')
hold on
pause

% loop over degrees
for l=1:1:3 
    
    % define number of intervals 
    n = 10; 
    h = linspace(alfa,beta,n); 
    
    for k=1:1:n-1 
        
        % compute the polynom inside each interval       
        x = linspace(h(k),h(k+1),l+1)'; y = f(x); % easch interval has l+1 nodes 
        a(k,1:l+1) = getPolynCoeff(x,y); % store the coefficient in a matrix 
                                     % of size (n-1)x(l+1)
        % plot the polynom
        t = linspace(h(k),h(k+1),100);
        yp(k,:) = polyval(a(k,1:l+1),t);
        plot(t,yp(k,:),'k')
        pause
        
    end
    
end
    