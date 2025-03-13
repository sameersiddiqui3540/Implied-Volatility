% Sample IV data (past 1 year, 252 trading days)
days = 1:252; % 252 trading days
IV_data = 20 + 10*sin(2*pi*days/126) + randn(1,252); % Simulated IV data with fluctuations

% Current IV
current_IV = 35;  % Assume todays IV is 35%

% Compute IV Rank
IV_max = max(IV_data);
IV_min = min(IV_data);
IV_rank = ((current_IV - IV_min) / (IV_max - IV_min)) * 100;
fprintf('IV Rank: %.2f%%\n', IV_rank);

% Compute IV Percentile
IV_below_current = sum(IV_data < current_IV);
IV_percentile = (IV_below_current / length(IV_data)) * 100;
fprintf('IV Percentile: %.2f%%\n', IV_percentile);

% Compute Mean IV
IV_mean = mean(IV_data);
fprintf('Mean IV: %.2f%%\n', IV_mean);

% Plot IV and Mean IV
figure;
plot(days, IV_data, 'b', 'LineWidth', 1.5); % Plot IV in blue
hold on;
yline(IV_mean, 'r--', 'LineWidth', 2); % Plot Mean IV as a red dashed line
hold off;

% Add labels and title
xlabel('Trading Days');
ylabel('Implied Volatility (%)');
title('Implied Volatility Over Time with Mean IV');
legend('Implied Volatility', 'Mean IV', 'Location', 'best');
grid on;

