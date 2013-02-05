function [means, clusters] = kmeansimp(k)

clc

means = zeros(k,3);

distmatrix = zeros(90,90);
load('data_90');

for i = 1:1:90
    for j = 1:1:90
        distmatrix(i,j) = eucliddistance(data_90(i,:),data_90(j,:));
    end
end


[~,index1]=max(distmatrix);
[~,index2]=max(max(distmatrix));

idistmatrix = index1(index2);
jdistmatrix = index2;

means(1,:) = data_90(idistmatrix,:);
means(2,:) = data_90(jdistmatrix,:);


for j = 3:k
    index = 0;
    maxprod = 0;
    for i = 1:90
        product=1;
        for n = 1:j-1
            product = product * eucliddistance(means(n,:), data_90(i,:));     
        end
        if product >= maxprod
            maxprod = product;
            index = i;        
        end
    end
    means(j,:) = data_90(index,:);
end 

converged = false;

clusters = zeros(90,1);

while ~converged
    for i = 1:90
        distances = zeros(1,0);
        for j = 1:k
            distances = [distances, eucliddistance(means(j,:), data_90(i,:))];
        end
        [v1, closestmean] = min(distances);
        clusters(i,1) = closestmean;
    end
    for j = 1:k
        meanj = zeros(0,3);
        for i = 1:90
          if clusters(i,1) == j
              meanj = [meanj; data_90(i,:)];           
          end 
        end
        converged = true;
        if means(j,:) ~= mean(meanj)
           converged = false; 
        end
        means(j,:) = mean(meanj);
    end  
end





