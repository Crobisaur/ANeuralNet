function [out] = generateInputs(v1)

dim = max(size(v1'));
if dim > 3
    for i=1:dim
        if i == dim-1
            generateInputs(v1( 
        generateInputs(v1(i:i+2));
        
for i=1:dim
    if i==dim
        out(i) = v1(i)*v1(1);
    else
        out(i) = v1(i)*v1(i+1);
    end
end