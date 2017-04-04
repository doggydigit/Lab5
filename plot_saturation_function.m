function plot_saturation_function

% plot the saturation function. Make sure
% to use the same values as in salam_cpg_oscil

dr=[0: 0.01: 6];
[nu_axis, R_axis] = saturation_function(dr, ...
    1, 5, ...         % d_low, d_high
    0.2, 0.3, ...     % c_nu_1, c_nu_0
    0.065, 1.196, ... % c_R_1, c_R_0
    0, 0);            % nu_sat, R_sat

[nu_limbs, R_limbs] = saturation_function(dr, ...
    1, 3, ...         % d_low, d_high
    0.2, 0, ...       % c_nu_1, c_nu_0
    0.131, 1.131, ... % c_R_1, c_R_0
    0, 0);            % nu_sat, R_sat

% Make figure with given title
figure('name', 'Saturation function');
clf;

subplot(211)

subplot(2,1,1);
set(gca,'FontSize',20)
hold on
plot(dr,nu_axis,dr,nu_limbs,'LineWidth',2)
legend('Axial','Limb')
xlabel('drive'); ylabel('Int. freq. nu');
subplot(2,1,2);
set(gca,'FontSize',20)
hold on
plot(dr,R_axis,dr,R_limbs,'LineWidth',2)
legend('Axial','Limb')
xlabel('drive'); ylabel('Amplitude R');
print -dpng saturation_function.png


function [nu, R] = saturation_function(d, d_low, d_high, c_nu_1, c_nu_0, c_R_1, c_R_0, nu_sat, R_sat)
% Make output vectors of same size as input 'd', initialized with saturated values
nu = nu_sat * ones(size(d));
R = R_sat * ones(size(d));

% Prepare boolean flags marking non-saturating drives
non_saturated = d_low <= d & d <= d_high;

% Calculate non saturated values
nu(non_saturated) = c_nu_1 * d(non_saturated) + c_nu_0;
R(non_saturated) = c_R_1 * d(non_saturated) + c_R_0;



