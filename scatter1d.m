function h = scatter1d(y,varargin)
% 20160329
if ~isempty(varargin)
    x = varargin{1};
else
    x = 1:length(y);
end

if ispc, markersize = 5;
else     markersize = 20; end
    
markercolor = 'b';
barcolor = 'b';
d = 0.3;

for ix = 1:length(x)
    hh = scatter(repmat(x(ix),size(y{ix})),y{ix},markersize);
    hh.MarkerEdgeAlpha = 0.5;
    hh.MarkerEdgeColor = markercolor;
    
    hold all
    
    m = nanmean(y{ix});
    plot([-1 1]*d+x(ix),[m m],'-','linewidth',1.5,'color',barcolor);
end
