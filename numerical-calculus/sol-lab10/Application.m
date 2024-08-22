fprintf('apline application to real problem\n')

% data
% x  y
% 65 3.52
% 55 3.62
% 45 3.65
% 35 3.52
% 25 3.47
% 15 3.25
%  5 3.15
% -5 3.15
% -15 3.2
% -25 3.27
% -35 3.52
% -55 3.7

% new data
% -45 3.7

x = [-55,-35,-25,-15,-5,5,15,25,35,45,55,65]'; % position 
y = [3.7,3.52,3.27,3.2,3.15,3.15,3.25,3.47,3.52,3.65,3.62,3.52]'; % temperature

% spline
t = linspace(-55,65,100)';
S = spline(x,y); Sval = ppval(S,t);

% plot 
figure(1)
plot(x,y,'y*')
hold on
plot(t,Sval,'r--')
hold on
xlabel('position')
ylabel('temperature')
title('cahnge in mean temperature over the time')

% interpolation via Vandermonde matrix
a = getPolynCoeff(x,y);
yp = polyval(a,t);
plot(t,yp,'b--')
legend('data', 'spline', 'Vandermonde')

% new data
x_new = -45;
y_new = 3.7;

% how well are the approximations in the new data
y_s = ppval(S,x_new); err_s = abs(y_new-y_s); 
y_a = polyval(a,x_new); err_a = abs(y_new-y_a);
disp('     err_a     err_s')
disp([err_a,err_s])

% lagrangian polynom
% lagrange_poly = 0;
% for i = 1:length(x)
%     p=1;
%     for j=1:length(x)
%         if j~=i 
%         c = poly((x-x(j)))/(x(i)-x(j));
%         p = conv(c, p);
%         end
%     end
%     lagrange_poly = lagrange_poly + y(i)*p;
% end

% Vandermonde method tend to overfitt data 
% spline method is able to generalize well