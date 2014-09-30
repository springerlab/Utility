function outstruct = structify96wmeta(metaarray)
%STRUCTIFY96WMETA
% 
% Used to be called get_strain_groups
%
% 20121019

outstruct = struct;
for p = 1:size(metaarray,3)
    for r=1:8
        for c=1:12
            label = metaarray{r,c,p};
            if isnumeric(label)
                label = num2str(label);
            end
            if isempty(strtrim(label))
                if ~isfield(outstruct,'EMPTY')
                    outstruct.EMPTY = [];
                end
                outstruct.EMPTY = [outstruct.EMPTY; p r c];
            else
                label = underscorify(label,1);
                if ~isfield(outstruct, label)
                    outstruct.(label) = [];
                end
                outstruct.(label) = [outstruct.(label); p r c];
            end
        end
    end
end                
