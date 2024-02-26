function [numerical_difference_array, mean_array_humans, mean_array_machine] = compute_numerical_difference(human_heatmaps_png, machine_heatmap_csv) 
% The first is a png file and the latter is a csv file

% Calculation of the 14x14 mean values for the averaged participant heatmap
mean_array_humans = ImageMeanArray(human_heatmaps_png); 

% Calculation of the 14x14 mean values for the machine heatmap (e.g., ViT)
mean_array_machine = csvMeanArray(machine_heatmap_csv);

% Difference between averaged human heatmap and machine heatmap 
human_machine_difference = abs(round(mean_array_humans - mean_array_machine));

numerical_difference_array = zeros(1,1);
numerical_difference_array = mean2(human_machine_difference);


