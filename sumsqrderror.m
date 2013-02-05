%Vincent Steil
%s1008380
%calculates the sum squared error given a mean and a column vector with
%cluster assignments
function [Error] = sumsqrderror(centroids, clustercolumn)

clc

load('data_90');

sum = 0;
for j = 1:length(centroids(:,1))
    for i = 1:length(clustercolumn(:,1))
        if j == clustercolumn(i,1)
            sum = sum + eucliddistance(data_90(i,:),centroids(j,:))^2;          
        end
    end
end

Error = sum/length(clustercolumn(:,1));


