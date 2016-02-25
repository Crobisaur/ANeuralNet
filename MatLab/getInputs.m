function [out] = getInputs(v1)
% Christopher Robison 2016
% This function will get the tesor products
% of an input vector v1
out = [prod(v1)];
dim = max(size(v1'));

while(true)
    dim = dim-1;
    if dim == 1
        %exit our loop
        break;
    else
        p = combnk(v1,dim);
        out =  [prod(p') out];
    end
end
% append our base inputs, out = [v1 out];
end
% if dim > 2
%     p = combnk(v1,dim-1);
%     out = [out prod(p')];
% elseif dim == 0
%     out = [out v1];
% else
    