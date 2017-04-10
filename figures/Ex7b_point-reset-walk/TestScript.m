times = 0:0.01:40;
drives = linspace(2, 2, length(times));

% Add white noise to drive
%drives(round(length(drives)/2):end) = awgn(drives(round(length(drives)/2):end),1);

[theta, r, x, dtheta] = salam_cpg_osc(times, drives);
plot_salam_cpg(times, x, dtheta, drives);