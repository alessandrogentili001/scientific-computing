function stirling_fact = stirling(kmax)
% compute the approximation of the factorial using the stirling method 

true_fact = 1;
abs_err = zeros(1, kmax);
rel_err = zeros(1, kmax);
for k = 1:kmax
    true_fact = true_fact*k;
    stirling_fact = sqrt(2*pi*k)*((k/exp(1))^k);

    abs_err(k) = abs(true_fact - stirling_fact);
    rel_err(k) = abs_err(k) / true_fact;
    disp([abs_err(k), rel_err(k)]);
end
semilogy(abs_err, 'ro')
hold on 
semilogy(rel_err, 'bo')
end