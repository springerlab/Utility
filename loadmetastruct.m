function outstruct = loadmetastruct(fn,omitempty)
% 20130117
% 20130226
outstruct = structify96wmeta(load96wmeta(fn));

% remove references to empty wells
if exist('omitempty')~=1
    omitempty=true;
end

if omitempty && isfield(outstruct,'EMPTY');
    outstruct = rmfield(outstruct,'EMPTY');
end
    