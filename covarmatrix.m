%Vincent Steil
%s1008380
%calculates the covariancematrix given the matrix of means, the cluster
%allocation in a vector and the index of the mean we want

function [covariancematrix] = covarmatrix(clustercolumn, means, meanindex)

load('data_90');


avg = means(meanindex,:);

clusteri = zeros(0,3);

covariancematrix = zeros(3,3);

%find only the points in the wanted cluster and stick them in clusteri
for n=1:90
    if clustercolumn(n,1) == meanindex
    clusteri = [clusteri; data_90(n,:)];
    end
end

%calculate the covariance matrix 
N = length(clusteri(:,1));

for i = 1:3
   for j = 1:3
       for n = 1:N
           covariancematrix(i,j) = covariancematrix(i,j) + (avg(i) - clusteri(n,i))*(avg(j) - clusteri(n,j));
       end
       
   end
end
covariancematrix = covariancematrix/(N-1);




