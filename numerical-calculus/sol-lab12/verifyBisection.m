fprintf('find zeros of a funciton with bisection method\n')

% function 
f = @(x,alfa)(alfa.*sin(x).*cos(x) - x.^3); % x_star = 0
% derivative
df = @(x,alfa)(alfa.*(cos(x).^2 - sin(x).^2) - 3*x.^2); % f'(x_star) = alfa
 
% stopping criteria
tolla = 0; tollr = 0; tollf = 10^(-8); kmax = 100;
% domain [a, b]
a = -0.2; b = 0.1;

for alfa = [1, -1e-7, 1e7]
    
    % plot
%     fplot(@(x)(f(x,alpha)),[a,b],'r')
%     hold on
%     fplot(@(x)(df(x,alpha)),[a,b],'b')
%     xlabel('x')
%     ylabel('y')
%     title('plot function varing alpha')
%     legend('f','df')
%     pause
    
    % bisection 
    [ind,x,y,k,afinal,bfinal] = bisection(@(x)(f(x,alfa)),a,b,tolla,tollr,tollf,kmax);
    fprintf('alfa = %d\n', alfa)
    fprintf('error = %d\n',abs(x))
    fprintf('ind = %d\n',ind)
    pause
    
end

% axis([-1,1,-1,1])
% hold off

%-------------------------------------------------------------------

fprintf('given a desired error, find the number of step seruired to obtain it\n')

% case alfa = 1 
f = @(x)(cos(x).*sin(x) - x.^3);

% desired error
eps = 10^(-9); 
% modify tollerances 
tolla = eps; tollf = 0; tollr = 0;
% interval length
I = b-a;
% number of steps required 
knec = ceil(log2(I/eps)-1); 

% compare the steps effectively required by the method with the theoretical
% one
[ind,x,y,k,a,b] = bisection(f,a,b,tolla,tollr,tollf,kmax);
fprintf('number of steps required: %d\n',knec)
fprintf('number of effective steps: %d\n',k)











