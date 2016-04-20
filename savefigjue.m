function savefigjue(fn,format)
% savefigjue saves a figure in the way that Jue prefers, as a 150dpi png
% (convenient for quickly putting in powerpoints and word documents in mac
% and windows) and as an eps file (convenient for editing in Illustrator).
%
% 20160213
print(fn,'-dpng','-r150');

% optional: output in eps format
if exist('format','var') && ~isempty(strfind(format,'eps'))
    print(fn,'-depsc');
end