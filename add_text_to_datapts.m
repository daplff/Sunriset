function [ output_args ] = add_text_to_datapts( datapts, labels, offset )
%ADD_TEXT_TO_DATAPTS Summary of this function goes here
%   Detailed explanation goes here



num_datapts = size(datapts, 1);

label_pos = datapts + offset;

for i = 1:num_datapts
    text(label_pos(i,1), label_pos(i,2), labels(i));
end

end

