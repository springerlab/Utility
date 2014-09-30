function out = adjust_yticks(ticks, n)
%ADJUST_YTICKS places an y tick mark at every number in TICKS and a tick
%label every N tick marks.
if exist('n')~=1
    n = 1;
end

ticklabels = {num2str(ticks(1))};
for c=1+n:n:length(ticks)
    for k=1:n-1
        ticklabels{end+1}='';
    end
    ticklabels{end+1} = num2str(ticks(c));
end

set(gca,'YTick',ticks);
set(gca,'YTickLabel',ticklabels);
