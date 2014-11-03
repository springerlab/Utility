function [hf ha] = scatternxn(data, varargin)
% SCATTERNXN takes a p-by-n matrix containing p observations of n
% variables, and plots a grid of (n-1)-by-(n-1) scatter plots of all the variables
% against all other variables, omitting redundant plots.
% 
% Created 20141016 by JW

% parse optional parameters
p = inputParser;
addParamValue(p,'plotoptions',{},@iscell);
addParamValue(p,'varnames',{},@iscell);
addParamValue(p,'varlim',{},@iscell);
addParamValue(p,'groups',{},@iscell);
addParamValue(p,'groupcolors',lines(14),@isnumeric);
addParamValue(p,'groupmarkers',{},@iscell);
addParamValue(p,'groupnames',{},@iscell);
addParamValue(p,'totalwidth',gettotalwidth,@isnumeric);

parse(p,varargin{:});
plotoptions = p.Results.plotoptions;
varnames = p.Results.varnames;
varlim = p.Results.varlim;
if isempty(varlim)
    varlim = cell(size(data,2),1);
end
groups = p.Results.groups;
groupcolors = p.Results.groupcolors;
groupmarkers = p.Results.groupmarkers;
groupnames = p.Results.groupnames;
totalwidth = p.Results.totalwidth;

% make the grid plot
n = size(data,2);
gappx = 15;
width = (totalwidth - (n-2)*gappx)./(n-1);

[hf ha] = gridplot(n-1,n-1,width,width,'gaphorz',gappx,'gapvert',gappx,...
    'margtop',70,'margright',70,'margleft',20,'margbot',20);
set(0,'defaulttextinterpreter','tex');

% dim the markers if highlighting
if isempty(groups)
    markeropt = {'ko'};
else
    markeropt = {'x','color',[0.5 0.5 0.5]};
end

for rplot = 1:(n-1)
    for cplot = 1:(n-1)
        x = data(:,cplot + 1);
        y = data(:,rplot);
        
        iplot = (n-1)*(rplot-1)+cplot;
        axes(ha(iplot))
        
        if rplot > cplot
            axis off;   % plots on main diagonal or below are redundant
            continue;
        end
        
        plot(x,y,markeropt{:},plotoptions{:});
        hold all
        
        % highlight subgroups of observations
        h = [];
        for igroup = 1:length(groups)
            idx = groups{igroup};
            
            x = data(idx,cplot + 1);
            y = data(idx,rplot);
            if ~isempty(groupmarkers)
                marker = groupmarkers{igroup};
            else
                marker = 'o';
            end
            h(igroup) = plot(x,y,marker,'color',groupcolors(igroup,:));
        end
        
        % axes limits
        if ~isempty(varlim{cplot + 1})
            xlim(varlim{cplot+1});
        end
        if ~isempty(varlim{rplot})
            ylim(varlim{rplot})
        end
        
        % label the plots on the edge
        set(gca,'xaxislocation','top');
        set(gca,'yaxislocation','right');
        if ~isempty(varnames)
            if rplot == 1
                xlabel(varnames{cplot + 1});
            end
            if cplot == n-1
                ylabel(varnames{rplot});
            end
        end
        
        % remove tick marks from interior subplots
        if rplot > 1
            set(gca,'xticklabel',[]);
        end
        if cplot < n-1
            set(gca,'yticklabel',[]);
        end
    end
end

% put group legend on last panel
if ~isempty(groupnames)
    hl = legend(h,groupnames,'interpreter','tex');
    set(hl,'units','pixels')
    a = get(hl,'position');
    a(1) = a(1) - width - gappx;
    set(hl,'position',a);
end
end

function totalwidth = gettotalwidth
a = get(0,'screensize');
totalwidth = min(a(3:4)) - 180;
end
