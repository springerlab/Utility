function ScatterError(mx,dx,my,dy,varargin)
% ScatterError makes a scatterplot with errorbars
%
% 20160213

plot(mx,my,'o',varargin{:});
hold all

col = [.5 .5 .5];

for idx = 1:length(mx)
    plot(mx([idx idx]), my(idx) + [-1 1].*dy(idx),...
        '-', 'color', col, 'linewidth',0.5);
    plot(mx(idx) + [-1 1].*dx(idx), my([idx idx]),...
        '-', 'color', col, 'linewidth',0.5);
end