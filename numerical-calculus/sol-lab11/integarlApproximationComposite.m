fprintf('integral approximation using composite trapezius method\n')

a = 0; b = 2*pi; % domain of integration 
f = @(x)(x.*exp(-x).*cos(2.*x)); % function to be integrated 

% figure(1)
% title('function to be integrated')
% fplot(f,[a,b],'r')

I_true = (3*(exp(-2*pi)-1)-10*pi*exp(-2*pi))/25; % true result 
err_old = 1;
disp ('       m       p')

for j = 1:8
    
    m = 2^j; % number of subintervals 
    I1m = trapeziusComposite(a,b,m,f); % composite trapezius formula
    
    % compute error and show convergence 
    err_new = abs(I_true - I1m);
    rho = err_old/err_new; p = log2(rho); % verify that p-->2 for m-->inf (n = 1 odd)
    err_old = err_new;
    
    disp([m,p]) 
    
end

%-------------------------------------------------------------------------

fprintf('integral approximation using composite cavalieri-simpson method\n')

a = 0; b = 2*pi; % domain of integration 
f = @(x)(x.*exp(-x).*cos(2.*x)); % function to be integrated 

% figure(1)
% title('function to be integrated')
% fplot(f,[a,b],'k')

I_true = (3*(exp(-2*pi)-1)-10*pi*exp(-2*pi))/25; % true result  
err_old = 1;
disp ('       m       p')

for j = 1:8
    
    m = 2^j; % number of subintervals 
    I2m = CavalieriSimpsonComposite(a,b,m,f); % composite cavalaieri-simpson formula
    
    % compute error and show convergence
    err_new = abs(I_true - I2m);
    rho = err_old/err_new; p = log2(rho); % verify that p-->4 for m-->inf (n = 2 even)
    err_old = err_new;
    
    disp([m,p]) 
    
end










