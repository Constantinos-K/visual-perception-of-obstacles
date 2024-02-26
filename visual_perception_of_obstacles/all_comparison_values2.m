% Initialize an array of image indices
images_of_interest = [94, 163, 507, 709, 1602, 1710, 4603, 4814, 6045, 6209, 9530, 9863, 10052, 10103, 10823, ...
                      10971, 13788, 13823, 14030, 14364];

% Initialize cell array with model names
model_names = {'efficientnet_b0', 'resnet18', 'resnet50', 'vgg19', 'mobilenet_v2', 'swin_b', 'vit_b_16'};

% Create a matrix to store the results
results_matrix = zeros(length(images_of_interest), length(model_names));

% Loop through each image and model
for i = 1:length(images_of_interest)
    for j = 1:length(model_names)
        image_idx = images_of_interest(i);
        model_name = model_names{j};
        file_name = sprintf('img_%06d_heatmap_%s.csv', image_idx, model_name);
        [result, mean_array_humans, mean_array_machine] = compute_numerical_difference(sprintf('%06d_all_tr.png', image_idx), file_name);
        results_matrix(i, j) = result;
    end
end


% Add labels to rows and columns
images_of_interest_str = cellstr(num2str(images_of_interest'));
% Convert the matrix to a table
results_table = array2table(results_matrix, 'RowNames', images_of_interest_str, 'VariableNames', model_names);

% Display the results matrix
% disp(results_matrix);

% Store results_matrix in a csv file
%writetable(results_table, 'results_table.csv')


