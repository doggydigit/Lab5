function plot3Param(times, x0, x1, x10, drives)

  drives = drives(:); % indexing with (:) ensures we have a column vector

  nrsubplots = 6;
  
  % Make figure with given title
  FigHandle = figure('name', 'Salamander CPG output');
  clf;
  
  % Colors from Tango palette
  blue = [0.16 0.34 0.59];
  green = [0.38 0.71 0.055];
  
  n_segments = 8;                     % 8 axial segments
  girdles = [1 5];                    % Forelimbs project to segments 1-4, hind limbs to segments 5-end
  
  % Indices for trunk and tail oscillators on left side
  trunk = 1:girdles(2) - 1;
  tail = girdles(2):n_segments;
  
  % Calculate matrix of vertical offsets to have a "stack" of oscillations.
  step = 3; % separation between 2 oscillations
  offsets = repmat((n_segments:-1:1) * step, length(times), 1);
  
  %textbox location?
  dim = [.2 .5 .3 .3];

  % First subplot: axial oscillations
  % Using two rows to make it twice the height of the other plots
  h1 = subplot(nrsubplots, 1, [1 2]);
  
  % Plotting trunk and tail oscillations separately, to have different colors:
  hold on;
  plot(times, x0(:, trunk) + offsets(:, trunk), 'color', blue, 'linewidth', 2);
  plot(times, x0(:, tail) + offsets(:, tail), 'color', green, 'linewidth', 2);
  hold off;
  
  ylabels = cellfun(@(i) sprintf('x%d', i), num2cell(n_segments:-1:1), 'uniformoutput', false);
  set(gca, 'ytick', fliplr(offsets(1, :)), 'yticklabel', ylabels, 'xtick', []);
  ylabel('x Body');
  title('Coupling strength between limbs = 0');

  % Limb oscillations
  h2 = subplot(nrsubplots, 1, 3);
  step = 4;
  offsets = [2 * step, step];
  hold on;
  LF = 2 * n_segments + 1; % left forelimb
  LH = 2 * n_segments + 3; % left hind limb
  plot(times, x0(:, LF) + offsets(1), 'color', blue, 'linewidth', 2);
  plot(times, x0(:, LH) + offsets(2), 'color', green, 'linewidth', 2);
  hold off;

  set(gca, 'ytick', fliplr(offsets), 'yticklabel', {sprintf('x%d', LH), sprintf('x%d', LF)}, 'xtick', []);
  ylabel('x Limb');
  ylim([0.5 3.5] * step);
  h2_pos = get(h2,'Position');
  h2_pos(2) = h2_pos(2)+0.024;
  set(h2,'Position',h2_pos);
  
  
  subplot(nrsubplots, 1, [4 5]);
  step = 3; % separation between 2 oscillations
  offsets = repmat((n_segments:-1:1) * step, length(times), 1);
  
  % Plotting trunk and tail oscillations separately, to have different colors:
  hold on;
  plot(times, x1(:, trunk) + offsets(:, trunk), 'color', blue, 'linewidth', 2);
  plot(times, x1(:, tail) + offsets(:, tail), 'color', green, 'linewidth', 2);
  hold off;
  
  ylabels = cellfun(@(i) sprintf('x%d', i), num2cell(n_segments:-1:1), 'uniformoutput', false);
  set(gca, 'ytick', fliplr(offsets(1, :)), 'yticklabel', ylabels, 'xtick', []);
  ylabel('x Body');
  title('Coupling strength between limbs = 1');

  % Limb oscillations
  h4 = subplot(nrsubplots, 1, 6);
  step = 4;
  offsets = [2 * step, step];
  hold on;
  LF = 2 * n_segments + 1; % left forelimb
  LH = 2 * n_segments + 3; % left hind limb
  plot(times, x1(:, LF) + offsets(1), 'color', blue, 'linewidth', 2);
  plot(times, x1(:, LH) + offsets(2), 'color', green, 'linewidth', 2);
  hold off;

  set(gca, 'ytick', fliplr(offsets), 'yticklabel', {sprintf('x%d', LH), sprintf('x%d', LF)}, 'xtick', []);
  ylabel('x Limb');
  ylim([0.5 3.5] * step);
  h4_pos = get(h4,'Position');
  h4_pos(2) = h4_pos(2)+0.024;
  set(h4,'Position',h4_pos);
  
%   subplot(nrsubplots, 1, [7 8]);
%   step = 3; % separation between 2 oscillations
%   offsets = repmat((n_segments:-1:1) * step, length(times), 1);
%   
%   % Plotting trunk and tail oscillations separately, to have different colors:
%   hold on;
%   plot(times, x10(:, trunk) + offsets(:, trunk), 'color', blue, 'linewidth', 2);
%   plot(times, x10(:, tail) + offsets(:, tail), 'color', green, 'linewidth', 2);
%   hold off;
%   
%   ylabels = cellfun(@(i) sprintf('x%d', i), num2cell(n_segments:-1:1), 'uniformoutput', false);
%   set(gca, 'ytick', fliplr(offsets(1, :)), 'yticklabel', ylabels, 'xtick', []);
%   ylabel('x Body');
%   title('Coupling of limbs to axial oscillators = 4');
% 
%   % Limb oscillations
%   h6 = subplot(nrsubplots, 1, 9);
%   step = 4;
%   offsets = [2 * step, step];
%   hold on;
%   LF = 2 * n_segments + 1; % left forelimb
%   LH = 2 * n_segments + 3; % left hind limb
%   plot(times, x10(:, LF) + offsets(1), 'color', blue, 'linewidth', 2);
%   plot(times, x10(:, LH) + offsets(2), 'color', green, 'linewidth', 2);
%   hold off;
% 
%   set(gca, 'ytick', fliplr(offsets), 'yticklabel', {sprintf('x%d', LH), sprintf('x%d', LF)}, 'xtick', []);
%   ylabel('x Limb');
%   ylim([0.5 3.5] * step);
%   h6_pos = get(h6,'Position');
%   h6_pos(2) = h6_pos(2)+0.024;
%   set(h6,'Position',h6_pos);
  
%   % Drive
%   subplot(nrsubplots, 1, 10);
%   plot(times, drives, 'color', 'black');
%   ylabel('Drive d');  
%   xlabel('Time [s]');

  
  print -dpng plot3param.png
  
end