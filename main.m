%main script to be run
%Vincent Steil
%s1008380

clc;
clear;

errors = [];

load('data_90');

%get the sum squared errors for k=2:5 to plot later
for k = 2:5
    errors = [errors, sumsqrderror(kmeansimpcentroids(k,data_90),kmeansimpclusters(k, data_90))];
end


%cluster the data90 using 3means
kmeansclusters90 = kmeansimpclusters(3,data_90);
means = kmeansimpcentroids(3,data_90);

%calculate the covariance matrixes
covarclustermatrix1 = covarmatrix(kmeansclusters90,means,1)
covarclustermatrix2 = covarmatrix(kmeansclusters90,means,2)
covarclustermatrix3 = covarmatrix(kmeansclusters90,means,3)


probabilities = zeros(900,3);
gaussianclusters = zeros(900,1);

load('data_900');

%find the gaussian probabilities for each point, relative to the centroids,
%find the largest probability for each point and classify accordingly
for i = 1:900
    for j = 1:3       
        probabilities(i,j) = gaussianprobability(means(j,:), covarmatrix(kmeansclusters90,means,j), data_900(i,:));
    end
    [C,I] = max(probabilities(i,:));
    gaussianclusters(i,1) = I;
end

%classify data900 using 3means clustering
kmeansclusters900 = kmeansimpclusters(3,data_900);
kmeanmeans900 = kmeansimpcentroids(3,data_900);

load('true_900');

%calculate the confusion matrices
%BEWARE!! for some reason, the cluster indexes in my data_900 and data_90
%vs the true_900 and true_90 have 2 and 3 switched. I rectified this, but
%only for the confusionmatrix. 
confusionmatrixgaussians = confusionmatrix(true_900, gaussianclusters)
confusionmatrixkmeans = confusionmatrix(true_900, kmeansclusters900)

%plot some pretty graphs, so you can tell, what is going on
plots

