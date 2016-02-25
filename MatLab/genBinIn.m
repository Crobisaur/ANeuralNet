function [ OUT ] = genBinIn( numBits )
%genBinIn returns an array of all binary numbers numBits in size

dataSet = [0:2^numBits-1]';
OUT = rem(floor(dataSet*pow2(-(numBits-1):0)),2);

end

