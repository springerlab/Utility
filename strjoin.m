function s = strjoin(str_cell, d, varargin)
% 
% s = join(str_cell, d) takes in one or two argument, and concatenate
% str_cell to one string. By default, d = '\n'. If d = 'index', str_cell is
% concatenate with indexing afterward.
%
% example:
%   s = join({'a', 'b'}, '_')
%   s = join({'a', 'b'}, '\n', 'index', 'on')
% 
% created by Bo Hua @ 06112012

flag.index = 0;

if nargin < 2
    d = '\n';
end

if length(varargin)>0
    for i = 1:2:length(varargin)
        switch varargin{i}
            case 'index'
                flag.index = strcmpi(varargin{i+1}, 'on');
            otherwise
                warning('Unexpected arguments');
        end
    end
end

% flag.index = 1;

s = [];

for i = 1:length(str_cell)-1

    ele = str_cell{i};
    
    if flag.index
        ele = [num2str(i), '\t', ele];
    end
    
    s = [s, ele, d];

end

ele = str_cell{length(str_cell)};

if flag.index
    ele = [num2str(length(str_cell)), '\t', ele];
end
s = [s, ele];