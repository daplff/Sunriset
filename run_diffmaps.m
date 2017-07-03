

datafiles = dir('Data/*.txt');
num_files = max(size(datafiles));
% useFiles = {'Lund.txt', 'Cambridge.txt',  'Hamburg.txt', 'Munich.txt', 'Berlin.txt', 'Cologne.txt'};
% useFiles = {'Hamburg.txt', 'Munich.txt', 'Berlin.txt', 'Cologne.txt', 'Frankfurt.txt'};
% num_files = max(size(useFiles));
data = [];
real_coordinates = zeros(num_files,2);

labels = cell(1,num_files);

for fileId = 1:num_files
    filename = char(datafiles(fileId).name);
    labels(fileId) = {string(filename(1:end-4))}; % take away '.txt'
%     filename = char(useFiles(fileId));
    thisfile = load_as_time_vals(filename);
%     thisfile = load_text_data(filename);
    
    real_coordinates(fileId, :) = extract_real_coords_from_file(filename);
    data = [data; reshape(thisfile, 1, [])];
end

distance_matrix = squareform(pdist(data));
% approximate_kernel_size = median(min(distance_matrix + eye(size(distance_matrix)) * max(distance_matrix(:))));
approximate_kernel_size = median(distance_matrix(:)) ;
kernel_matrix = exp(- (distance_matrix/approximate_kernel_size).^2);
kernel_matrix = normalizeKernel(kernel_matrix);
[eigenvectors, eigenvalues] = constructDMaps(kernel_matrix, 4);

figure; scatter(eigenvectors(:,2), eigenvectors(:,3))
add_text_to_datapts(eigenvectors(:,2:3), labels, [0.02,0.02])
figure; scatter(real_coordinates(:,1), real_coordinates(:,2))
add_text_to_datapts(real_coordinates, labels, [0.1,0.1])
