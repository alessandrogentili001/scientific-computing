function x = solveLowerTriang(L, b)
    % solve a linear system Lx = b, where L is lower triangular
    % L: lower triangular matrix (n x n)
    % b: right-hand side vector (n x 1)
    % x: solution vector (n x 1)
    
    % Get the number of rows (or columns) of L
    n = length(b);
    
    % Initialize the solution vector x with zeros
    x = zeros(n, 1);
    
    % Perform forward substitution
    x(1) = b(1) / L(1, 1); % First element
    for i = 2:n
        x(i) = (b(i) - L(i, 1:i-1) * x(1:i-1)) / L(i, i);
    end
    
    % Display the result
    %fprintf('Residual norm: %e\n', norm(b - L*x));
end
