function ris = secantPlot(f,x0,x1,tollf,tolla,tollr,kmax)

y0 = f(x0); y1 = f(x1);
ris = [abs(y0),abs(y1)];
k = 3; 

while k <= kmax
        
    q = (y1 - y0)/(x1 - x0); % secant method iteration
    d = y1/q; 
    % criteria on residual
    if abs(y1) < tollf, disp(' esco per il residuo'); return, end 
    % criteria on increment
    if abs(d) < tollr*abs(x1) + tolla, disp(' esco per incremento'); return, end 
    % go on 
    x0 = x1; y0 = y1; % update index 
    x1 = x1 - d;  
    y1 = f(x1); ris(k) = abs(y1); 
    k = k + 1;
    
end
