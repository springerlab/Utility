function h = plotfilledhist(x,y,varargin)
% PLOTFILLEDHIST plots a histogram as a patch, filled in with color.
% Default is blue, no outline, 50% transparency
%
%   Created 20151015

% parse arguments, set defaults
p = inputParser;
addParamValue(p,'color',[0 0 1],@(x) true);
addParamValue(p,'alpha',0.5,@isnumeric);
addParamValue(p,'drawoutline',false,@islogical);
addParamValue(p,'drawfill',true,@islogical);
addParamValue(p,'plotoptions',{},@iscell);

parse(p,varargin{:});
color = p.Results.color;
alpha = p.Results.alpha;
drawoutline = p.Results.drawoutline;
drawfill = p.Results.drawfill;
plotoptions = p.Results.plotoptions;

if size(x,2)<size(x,1)
    x = x';
end

if size(y,2)<size(y,1)
    y = y';
end

if drawoutline
    plot(x,y,'-','color',color);
    hold all
end

if drawfill
    patch([x(1) x x(end) x(1)],[0 y 0 0],color,'facealpha',alpha,...
        'edgecolor','none',plotoptions{:});
    hold all
end

% set(gca,'xticklabelmode','auto')
% set(gca,'yticklabelmode','auto')

