function ind = well2ind(wells)
%WELL2IND converts a string containing the name of a well into a
%matrix index, column-major order. If the argument is a cell array of strings, the
%output is an array of indices.
%
%   20121230 JW
if ischar(wells)
    wells = {wells};
end

[r,c] = well2coord(wells);

ind = sub2ind([8 12],r,c);