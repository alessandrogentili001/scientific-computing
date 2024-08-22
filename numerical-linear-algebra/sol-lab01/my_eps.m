function [b] = my_eps()
% compute the roud-off unit of the machine (epsilon)

a = 1;
b = 1;
while a+b > a
    b = b/2;
end
