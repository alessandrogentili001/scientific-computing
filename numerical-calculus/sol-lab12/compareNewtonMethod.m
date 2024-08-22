% Define the function and its derivative
f = @(x) atan(x);
df = @(x) 1/(1 + x^2);

% Set parameters for Newton's method
tollr = 1e-6;  % Relative tolerance
tolla = 1e-6;  % Absolute tolerance
tollf = 1e-6;  % Function tolerance
kmax = 100;    % Maximum number of iterations

% Different initial points to test
initial_points = [-1.4, -1, 0, 1, 1.4];

% Pre-allocate results for comparison
results_newton1d = zeros(length(initial_points), 3);  % [final x, index, iterations]
results_newton1dFD = zeros(length(initial_points), 3); % [final x, index, iterations]

% Loop over initial points to test both methods
for i = 1:length(initial_points)
    x0 = initial_points(i);

    % Run newton1d
    [ind1, x1, ~, k1] = newton1d(f, df, x0, tollf, tolla, tollr, kmax);
    results_newton1d(i, :) = [x1, ind1, k1];
    
    % Run newton1dFiniteDifference
    [x2, ind2] = newton1dFiniteDifference(f, x0, tollr, tolla, tollf, kmax);
    results_newton1dFD(i, :) = [x2, ind2, k1];
end

% Display the results
disp('Comparison of newton1d and newton1dFiniteDifference:');
disp('Initial Point | Newton1d Final x | Index | Iterations | Newton1dFD Final x | Index | Iterations');
for i = 1:length(initial_points)
    fprintf('%12.4f | %18.4f | %5d | %10d | %18.4f | %5d | %10d\n', ...
            initial_points(i), ...
            results_newton1d(i, 1), results_newton1d(i, 2), results_newton1d(i, 3), ...
            results_newton1dFD(i, 1), results_newton1dFD(i, 2), kmax);
end
