function [rows cols] = well2coord(wells)
%WELL2COORD converts a string containing the name of a well into a
%numerical coordinate. If the argument is a cell array of strings, the
%outputs are arrays of row and column coordinates.
%
%   2012/07/28 JW
if ischar(wells)
    wells = {wells};
end

for w=1:length(wells)
    well=wells{w};
    letter = well(1);
    cols(w) = str2num(well(2:end));

    upper = 'ABCDEFGH';
    lower = 'abcdefgh';

    a = find(letter==upper);
    b = find(letter==lower);

    if ~isempty(a)
        rows(w) = a;
    elseif ~isempty(b)
        rows(w) = b;
    else
        error('Invalid row name.');
    end
end