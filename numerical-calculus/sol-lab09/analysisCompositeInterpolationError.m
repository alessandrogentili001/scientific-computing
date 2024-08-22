fprintf('analysis composite polynomial interpolation error\n')

format short 

% humps function
f = @(x)(1./((x-3/10).^2 + 1/100) + 1./((x-9/10).^2 + 4/100) - 6);
alfa = 0; beta = 2;

% degree 
l = 2; 

err_tot_old = 1;

disp('       h       err       p') 

% loop over the number of subintevals
for k=1:10
    
    % split the interval in sub-intervals 
    h = (1/2)^k; % lenght of each subinterval
    m = (beta-alfa)/h; % number of subintervals required 
    x = linspace(alfa,beta,m+1);
    
    
    for j=1:m
        
        % compute the polynom inside each subinterval
        x_in = linspace(x(j),x(j+1),l+1)'; y = f(x_in);
        a = getPolynCoeff(x_in,y);
        
        % compute the error inside each subinterval
        t = linspace(x(j),x(j+1),1000);
        yp = polyval(a,t);
        err(j) = max(abs(f(t)-yp));
        
    end
    
    % compute the error in the whole interval  
    err_tot = max(err);
    p = log2(err_tot_old/err_tot);
    err_tot_old = err_tot; % update the error
    
    disp([h,err_tot,p])
    pause
    
end
        
% verify that p --> l+1
    
    
    
    
    
    