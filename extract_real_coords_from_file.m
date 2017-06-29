function [ coords_out ] = extract_real_coords_from_file( filename )
%EXTRACT_REAL_COORDS_FROM_FILE Summary of this function goes here
%   Detailed explanation goes here

textdata = fileread(filename);

coordIndices = strfind(textdata,'Location: ');

coordinate_string = textdata(coordIndices + 10: coordIndices + 24);

if coordinate_string(1) == 'E'
    ew_mult = 1;
else
    ew_mult = -1;
end

if coordinate_string(10) == 'N'
    ns_mult = 1;
else
    ns_mult = -1;
end

ew_degs = (str2num(coordinate_string(2:4)) + str2num(coordinate_string(6:7))/60) * ew_mult;
ns_degs = (str2num(coordinate_string(11:12)) + str2num(coordinate_string(14:15))/60) * ns_mult;

coords_out = [ew_degs, ns_degs];

end

