%Vincent Steil
%s1008380
%calculates the gaussian probability given a mean (mew), covariancematrix
%and a point

function [probability] = gaussianprobability(mew, covariancematrix, point)

%mew and the point need to be reshaped to fit the equation used to find the
%probability
x = reshape(point, 3, 1);
mu = reshape(mew, 3, 1);

exponent = (-0.5) * (x - mu)' * inv(covariancematrix) * (x - mu);
  
A = ((2*pi)^1.5)*((det(covariancematrix))^0.5);

probability = (1/A)*exp(exponent);

