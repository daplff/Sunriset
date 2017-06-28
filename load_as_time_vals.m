function [ only_minutes ] = load_as_time_vals( filename )
%LOAD_AS_TIME_VALS Load data file and convert to minutes after midnight
%   Data is stored as "hhmm", and needs to be converted to minutes after
%   midnight in order to be meaningful.

data = importdata(filename,' ', 9); % 9 header lines, delimiter space
matrix = data.data(:,2:end); % First column is the date (constant)

matrix(isnan(matrix)) = 0; % set missing values to 0

% convert from format "hhmm" to minutes
hours = floor(matrix/100);
minutes = matrix - hours;

only_minutes = hours * 60 + minutes;





end

