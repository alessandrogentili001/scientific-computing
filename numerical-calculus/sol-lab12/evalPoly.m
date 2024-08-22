function [y,dy] = evalPoly(a,x)
% evaluate a polynom and its derivative in x with the Horner method 
% p = a = [a0,a1,.......,an]

n = length(a);
y = a(n);
dy = y;

for j = 1:n-2
    
    y = y*x + a(n-j); % compute p(x)
    dy = dy*x + y; % compute p'(x)
    
end

y = y*x + a(1);