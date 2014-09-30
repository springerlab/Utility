% returns true if string s is identical to a string in cell array list
function out = str_in(s,list)
    for i=1:length(list)
        if strcmp(s,list{i})
            out=1;
            return;
        end
    end
    out=0;
end