lambda = 0:0.0005:1;

for j = 1:numel(lambda)
    L = lambda(j);
    f1 = [21, 16, 40, 41, 585, 120, 164, 884];
    f2 = [1, 0.75, 0.5, 0.5, 0.45, 2.15, 0.95, 2.0];
    
    f = (1 - L)*f1 + L*f2;

    A = [-0.85, -1.62, -2.86, -0.93, -23.4, -16, -9, 0;
        -0.33, -0.2, -0.39, -0.24, -48.7, -5, -2.6, -100;
        0.33, 0.2, 0.39, 0.24, 48.7, 5, 2.6, 100;
        -4.64, -2.37, -3.63, -9.58, -15, -3, -27, 0;
        9, 28, 65, 69, 3.8, 120, 78, 0;
        0.4, -0.6, -0.6, 0.4, 0.4, 0.4, 0.4, 0.4;
        -eye(8)];

    b = [-15; -2; 8; -4; 200;  0; zeros(8,1)];

    [X,FVAL,EXITFLAG] = linprog(f,A,b);

    calories_per_ingredient = [21, 16, 40, 41, 585, 120, 164, 884];
    cost_per_ingredient = [1, 0.75, 0.5, 0.5, 0.45, 2.15, 0.95, 2];
    
    if (EXITFLAG == 1)
        cost(j) = cost_per_ingredient * X;
        calories(j) = calories_per_ingredient * X;
    else
        cost(j) = NaN;
        calories(j) = NaN;
    end
end

figure(1)
title('Cost vs. Calorie Optimization')
plot(calories, cost, 'k-')
hold on
plot(calories, cost, 'r.', 'markersize', 25)
grid on
xlabel('Calories (kcal)')
ylabel('Cost ($)')