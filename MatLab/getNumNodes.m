function [ out ] = getNumNodes( n )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
out = 0;
for i=1:3
out = out + nchoosek(n,i);

end

