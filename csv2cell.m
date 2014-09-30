function table = csv2cell(filename, delim)
% TABLE = csv2cell(FILENAME, DELIM)
%
% This function reads a file named FILENAME containing a table of numbers
% and strings and saves the result to the cell array TABLE. Numerical data
% are converted to double. Elements in the file are assumed to be separated
% by a delimiter DELIM. If DELIM is omitted, a comma is used by default.
% 
% 
% written 20110727 JW
% updated 20120413 BH: solved the bug when token is a number array 
% updated 20120604 JW: better variable names, error-checking, simpler array
%   sizing, optional delimiter argument
if nargin < 2
    delim = ',';
end

table = {};
fid = fopen(filename,'r');
if fid < 0
    fprintf('File failed to open.\n');
    return;
end

row = 1;
while ~feof(fid)
    line = fgetl(fid);
    tokens = regexp(line,delim,'split');
    
    col = 1;
    for i = 1:length(tokens)
        token = tokens{i};
        % avoid using str2num(.), which converts array-like input to
        % arrays, e.g. str2num('1:3')
        num = str2double(token);
        if isnan(num)
            % store as string
            table{row,col} = token;
        else
            table{row,col} = num;
        end
        col = col + 1;
    end
    row = row + 1;
end
fclose(fid);