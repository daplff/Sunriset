function [ data_without_explicit_coordinates ] = load_text_data( filename )
%LOAD_TEXT_DATA Summary of this function goes here
%   Detailed explanation goes here

textdata = fileread(filename);

start_indices = strfind(textdata,'h m');

data_without_explicit_coordinates = textdata(start_indices(1):(start_indices(1) + 4344));


end

