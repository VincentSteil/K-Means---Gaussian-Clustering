%Vincent Steil
%s1008380
%kmeans, returns the means in a kx3 matrix
%for commentary, see the near identical kmeansimpcluster.m
function [means] = kmeansimpcentroids(k, input)



means = zeros(k,3);

distinput = zeros(length(input(:,1)),length(input(:,1)));


for i = 1:1:length(input(:,1))
    for j = 1:1:length(input(:,1))
        distinput(i,j) = eucliddistance(input(i,:),input(j,:));
    end
end


[~,index1]=max(distinput);
[~,index2]=max(max(distinput));

idistinput = index1(index2);
jdistinput = index2;

means(1,:) = input(idistinput,:);
means(2,:) = input(jdistinput,:);


for j = 3:k
    index = 0;
    maxprod = 0;
    for i = 1:length(input(:,1))
        product=1;
        for n = 1:j-1
            product = product * eucliddistance(means(n,:), input(i,:));     
        end
        if product >= maxprod
            maxprod = product;
            index = i;        
        end
    end
    means(j,:) = input(index,:);
end 

converged = false;

clusters = zeros(length(input(:,1)),1);

while ~converged
    for i = 1:length(input(:,1))
        distances = zeros(1,0);
        for j = 1:k
            distances = [distances, eucliddistance(means(j,:), input(i,:))];
        end
        [v1, closestmean] = min(distances);
        clusters(i,1) = closestmean;
    end
    for j = 1:k
        meanj = zeros(0,3);
        for i = 1:length(input(:,1))
          if clusters(i,1) == j
              meanj = [meanj; input(i,:)];           
          end 
        end
        converged = true;
        if means(j,:) ~= mean(meanj)
           converged = false; 
        end
        means(j,:) = mean(meanj);
    end  
end

