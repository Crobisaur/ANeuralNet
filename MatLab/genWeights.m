function [ W ] = genWeights( n )
%
%   Detailed explanation goes here
%nIpts = n+(n*(n-1)/2); %find the number of inputs for the layer
nIpts = getNumNodes(n);
W = rand(nIpts+1,1); % adding a 1 b/c of bias node
end

