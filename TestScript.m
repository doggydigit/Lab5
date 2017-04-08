close all

%% Initialize 
times = 0:0.01:40;
drives = linspace(5, 0, length(times));

%% Add white noise to drive
% sigma = linspace(0,4,length(times));
% for i=1:length(times)
%     drives(i) = normrnd(drives(i),sigma(i));
% end

%% Simulate and Plot
%sigma = [zeros(ceil(length(times)/4),1)', linspace(0,0.9,floor(length(times)*3/4))];
[theta, r, x, dtheta] = salam_cpg_osc(times, drives);
xl = x;
xr = [x(:,9:16),x(:,1:8),x(:,18),x(:,17),x(:,20),x(:,19)];
%plot_salam_cpg(times, xl, dtheta, drives);
%plot_salam_cpg(times, xr, dtheta, drives);
plot_all_oscillators(times,x,dtheta,drives);