function [ind,x,y,k,a,b] = bisection(f,a,b,tolla,tollr,tollf,kmax)
% implement bisection method in order to find the point x such that 
% f(x) = 0

% stopping criteria and indicators
% ind = -1 --> kmax
% ind = 1 --> [a,b]
% ind = 2 --> f 

ind = -1;
fa = f(a);

disp('       k       xk       f(xk)       a         b        b-a')
 
k = 1;
while k <= kmax
    
    x = a + (b-a)/2; 
    y = f(x);
    % criteria on f 
    if abs(y) < tollf, ind=2; return, end
    % criteria on domain [a,b]
    if b-a < tolla + tollr*abs(a), ind=1; return, end
    % go on 
    if fa*y < 0
        b=x;
    else
        a=x; fa=y; 
    end 
    disp([k,x,y,a,b,abs(b-a)])
    k = k+1;
    
end 

    
    
    
    
    
    