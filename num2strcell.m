function out = num2strcell(num,varargin)
% 20130306
out = cellfun(@(x)num2str(x,varargin{:}),num2cell(num),'uniformoutput',false);