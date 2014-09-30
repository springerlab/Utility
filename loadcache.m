function out = loadcache(prefix)
%LOADCACHE loads most recent .mat file that starts with PREFIX
%
%   20120925
fns = dir([prefix '*mat']);
fns = fns(~[fns.isdir]);
[~,idx] = sort([fns.datenum]);
fns = {fns(idx).name};

if isempty(fns)
    disp(['No file starting with ''' prefix ''' found.']);
    out=[];
else
    disp(['Loading ' fns{end}]);
    s = load(fns{end});
    fields = fieldnames(s);
    out = s.(fields{1});
end