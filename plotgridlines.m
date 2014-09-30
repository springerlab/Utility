function h=plotgridlines(xgrid,ygrid,options)
% 20130416

if ~exist('options','var')
    options = {};
end

hold all
color = [ .5 .5 .5];
% color = 'r';

h=[];
idx=1;
for ix=1:length(xgrid)
    h(idx)=plot(xgrid([ix ix]),ylim,':','color',color,options{:});
    idx=idx+1;
end
for iy=1:length(ygrid)
    h(idx)=plot(xlim,ygrid([iy iy]),':','color',color,options{:});
    idx=idx+1;
end