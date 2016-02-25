function [ out ] = sigmoid( sumdInputs )
%Sigmoid, apply sigmoid function to a scalar input
%   Applies sigmoid to input which is the sum of inputs*weights + bias
%   Returns scalar output value.

% out = 2./(1+exp(-2*sumdInputs))-1; % for (0,1)
out = 1./(1+exp(-sumdInputs)); % for (-1,1)

end

