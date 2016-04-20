function h = ScatterError(mx,dx,my,dy,varargin)
% ScatterError makes a scatterplot with errorbars
%
% 20160213
p = inputParser;
% addParameter(p,'markerOptions',{'linewidth',1,'markersize',5},@iscell);
addParameter(p,'markerOptions',{10,[0 0 1],'markerfacecolor',[0 0 1]},@iscell);
addParameter(p,'errbarOptions',{'linewidth',0.5,'color',[.5 .5 .5]},@iscell);
parse(p,varargin{:});
markerOptions = p.Results.markerOptions;
errbarOptions = p.Results.errbarOptions;

% plot(mx,my,'o',markerOptions{:});
h=scatter(mx,my,markerOptions{:});
hold all

col = [.5 .5 .5];

for idx = 1:length(mx)
    plot(mx([idx idx]), my(idx) + [-1 1].*dy(idx),...
        '-', 'color', col,errbarOptions{:});
    plot(mx(idx) + [-1 1].*dx(idx), my([idx idx]),...
        '-', 'color', col,errbarOptions{:});
end