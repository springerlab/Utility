function status = cell2csv(c,fn,delim)
% 20120126
% writes a cell array to a file
% assumes c is a 2-dim cell either strings or numbers
if nargin < 3
    delim = ',';
end
out = cell2csvstring(c,delim);
fh = fopen(fn,'w');
status = fprintf(fh,'%s', out);
fclose(fh);