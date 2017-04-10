%% Initialize 
times = 0:0.01:20;
drives = linspace(2, 2, length(times));

%% Add white noise to drive
% sigma = linspace(0,4,length(times));
% for i=1:length(times)
%     drives(i) = normrnd(drives(i),sigma(i));
% end

%% Simulate and Plot
%sigma = [zeros(ceil(length(times)/4),1)', linspace(0,0.9,floor(length(times)*3/4))];
[theta, r, x0, dtheta] = salam_cpg_osc(times, drives);
%plot_salam_cpg(times, x, dtheta, drives);