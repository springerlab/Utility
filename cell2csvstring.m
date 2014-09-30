function out = cell2csvstring(c, delim)
% formats a cell array into a delimited (default:comma) text string
% assumes c is a 2-dim cell containing a header row and header column
% 20120126 (created 1/24/2011)
if nargin < 2
    delim = ',';
end
out = '';
for i=1:size(c,1)
    % first item in each row
    el = c{i,1};
    if ischar(el)
        out = [out sprintf('%s',el)];
    else
        out = [out sprintf('%d',el)];
    end
    % other items, with delimiter in front
    for j=2:size(c,2)
        el = c{i,j};
        if ischar(el)
            out = [out sprintf([delim '%s'],el)];
        else
            out = [out sprintf([delim '%d'],el)];
        end
    end
    out = [out sprintf('\n')];
end