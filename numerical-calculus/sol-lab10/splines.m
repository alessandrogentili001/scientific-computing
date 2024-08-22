fprintf('splines of degree 3 without the choice of the derivative at extremal points\n')

% sunction 
f = @(x)(sin(x).*cos(x));
alfa = 0; beta = 2*pi; 

% plot function
figure(1)
xlabel('x')
ylabel('y')
title('spline of degree 3 without the choice of derivatives at extremal points')
fplot(f,[alfa,beta],'k-')
hold on
pause

% loop over number of nodes 
for n = 4:4:12 
    
    % compute valuation points 
    x = linspace(alfa,beta,n)'; y = f(x);
    t = linspace(alfa,beta,1000)';
    
    % compute spline for nodes (x, y) evaluated over t 
    s = spline(x,y,t);  
    
    % plot spline 
    plot(t,s)
    hold on 
    pause
    
end

%----------------------------------------------------------------------------------

fprintf('splines of degree 3 with the choice of the derivative at extremal points\n')

% plot function
figure(2)
xlabel('x')
ylabel('y')
title('splines of degree 3 with the choice of the derivative at extremal points')
fplot(f,[alfa,beta],'k-')
hold on
pause

% impose condition of derivatives at extremal points  
itype = input( 'choose derivative value (1 o -1) at extremal points: ');

% loop over number of nodes 
for n = 4:4:12
    
    % evaluation points 
    x = linspace(alfa,beta,n)'; y = f(x);
    t = linspace(alfa,beta,1000)';
    
    % derivative values at extremal points
    switch itype
        
        case 1 
            
            d_alfa = 1; d_beta = 1; 
            
        case -1
            
            d_alfa = -1; d_beta = -1; 
            
        otherwise
            
            disp('erros in derivative values!'), return
    
    end 
    
    % compute spline
    s = spline(x,[d_alfa;y;d_beta],t);
    
    % plot spline
    plot(t,s)
    hold on 
    pause
    
end
    
    
% the spline somputation is better if we choose derivative 1 at extremal
% points ( = derivative value of the function at extremal points)
    
    
    
    
 
