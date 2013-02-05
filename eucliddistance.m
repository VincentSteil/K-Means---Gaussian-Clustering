%Vincent Steil
%s1008380
%take a wild guess at what this computes...

function [distance] = eucliddistance(A,B)
sum=0;
for i = 1:1:length(A)
    idiff = A(i)-B(i);
    sum = sum + (idiff^2);
end

distance = sqrt(sum);
