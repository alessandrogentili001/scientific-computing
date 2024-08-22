fprintf('runge function approximation with composite interpolation\n')

% runge function
f = @(x)(1./(1+x.^2));
alfa=-5; beta=5;

% plot function 
figure(1)
fplot(f,[alfa,beta],'r--')
hold on
xlabel('x')
ylabel('y')
title('Runge')

% grades
l1 = 1; l2 = 2;

% length of intervalls 
H = 0.9;

for k=1:5
    
    % compute intervals
    h(k) = (H)^k; m = (beta-alfa)/h(k); x = linspace(alfa,beta,m+1);
    
    for j=1:m
        
        % compute polynomials in each interval
        x_in1 = linspace(x(j),x(j+1),l1+1)'; y1 = f(x_in1); a1 = getPolynCoeff(x_in1,y1); 
        x_in2 = linspace(x(j),x(j+1),l2+1)'; y2 = f(x_in2); a2 = getPolynCoeff(x_in2,y2);
        
        % compute the values of the polynomials 
        t = linspace(x(j),x(j+1),1000);
        yp1 = polyval(a1,t); 
        yp2 = polyval(a2,t);
        
        % plot polynomials
        plot(t,yp1,'y')
        plot(t,yp2,'g')
        
        % compute the errors in each interval 
        err1(j) = max(abs(f(t)-yp1)); 
        err2(j) = max(abs(f(t)-yp2));
        
    end
    
    % compute the errors in the entire domain
    % [alfa,beta]
    err_tot1(k) = max(err1); 
    err_tot2(k) = max(err2);
    
end

disp('      h        err1      err2')
disp([h',err_tot1',err_tot2'])

legend('runge','pol comp 1','pol comp 2')

% grafico degli errori
figure(2)
plot((1:k),err_tot1,'y')
hold on
plot((1:k),err_tot2,'g')
xlabel('length intervals')
ylabel('error')
title('compare runge function approximation errors')
legend('errore 1','errore 2')
        
        
        
        
        
        
        
        
        
        
        
    