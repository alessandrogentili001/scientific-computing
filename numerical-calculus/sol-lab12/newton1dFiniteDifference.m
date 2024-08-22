function [x,ind] = newton1dFiniteDifference(f,x0,tollr,tolla,tollf,kmax)
% implement the newton method approximating the derivatives with the method
% of finite central differences

ind = -1;
x = x0; 
y = f(x);
k = 1; 
h = 1e-4;

disp('       k       x_k      res(k)')

while k <= kmax
    
    df = (f(x + h) - f(x - h))/(2*h); % finite central differences  
    d = y/df; 
    x = x - d;
    y = f(x); res(k) = abs(y);
    % criteria on residual
    if abs(y) < tollf, ind = 2; break, end 
    % criteria on increment
    if abs(d) < tollr*abs(x) + tolla, ind = 1; break, end 
    % go on
    disp([k,x,res(k)])
    k = k + 1;
    
end

% figure(100)
% plot(res)
% ylabel('residuo')
% title('grafico della convergenza')
% legend('res')



