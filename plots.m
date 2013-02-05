%Vincent Steil
%s1008380
%creates the plots of the various data points

%sum squared error
x = 2:k;
plot(x, errors), grid on, xlabel('k'), ylabel('Sum Squared Error'), title('Sum Squared Error Plot')




%3d plot for the gaussian clusters of data900
    cluster1 = zeros(0,3);
    for n=1:900
        if gaussianclusters(n,1) == 1
        cluster1 = [cluster1; data_900(n,:)];
        end
    end
        
    
    
    cluster2 = zeros(0,3);
    for n=1:900
        if gaussianclusters(n,1) == 2
        cluster2 = [cluster2; data_900(n,:)];
        end
    end
    
    
    cluster3 = zeros(0,3);
    for n=1:900
        if gaussianclusters(n,1) == 3
        cluster3 = [cluster3; data_900(n,:)];
        end
    end
    
axes1 = axes('Parent',figure);
view(axes1,[45 35]);
grid(axes1,'on');
hold(axes1,'all');

title('Clusters obtained through gaussian classification of data900');

scatter3(cluster1(:, 1), cluster1(:,2), cluster1(:,3), 'b', 'o');
scatter3(cluster2(:, 1), cluster2(:,2), cluster2(:,3), 'c', 'x');
scatter3(cluster3(:, 1), cluster3(:,2), cluster3(:,3), 'r', '*');


%3d plot for clusters using kmeans for data900
    cluster4 = zeros(0,3);
    for n=1:900
        if kmeansclusters900(n,1) == 1
        cluster4 = [cluster4; data_900(n,:)];
        end
    end
       
    
    cluster5 = zeros(0,3);
    for n=1:900
        if kmeansclusters900(n,1) == 2
        cluster5 = [cluster5; data_900(n,:)];
        end
    end
    
    
    cluster6 = zeros(0,3);
    for n=1:900
        if kmeansclusters900(n,1) == 3
        cluster6 = [cluster6; data_900(n,:)];
        end
    end
    
axes1 = axes('Parent',figure);
view(axes1,[45 35]);
grid(axes1,'on');
hold(axes1,'all');

title('Data900 classified into 3 clusters using kmeans with k=3');

scatter3(cluster4(:, 1), cluster4(:,2), cluster4(:,3), 'b', 'o');
scatter3(cluster5(:, 1), cluster5(:,2), cluster5(:,3), 'c', 'x');
scatter3(cluster6(:, 1), cluster6(:,2), cluster6(:,3), 'r', '*');



%kmeans clusters for data90
    cluster7 = zeros(0,3);
    for n=1:90
        if kmeansclusters90(n,1) == 1
        cluster7 = [cluster7; data_90(n,:)];
        end
    end
       
    
    cluster8 = zeros(0,3);
    for n=1:90
        if kmeansclusters90(n,1) == 2
        cluster8 = [cluster8; data_90(n,:)];
        end
    end
    
    
    cluster9 = zeros(0,3);
    for n=1:90
        if kmeansclusters90(n,1) == 3
        cluster9 = [cluster9; data_90(n,:)];
        end
    end
    
axes1 = axes('Parent',figure);
view(axes1,[45 35]);
grid(axes1,'on');
hold(axes1,'all');

title('Data90 (not Data900!) classified into 3 clusters using kmeans with k=3');

scatter3(cluster7(:, 1), cluster7(:,2), cluster7(:,3), 'b', 'o');
scatter3(cluster8(:, 1), cluster8(:,2), cluster8(:,3), 'c', 'x');
scatter3(cluster9(:, 1), cluster9(:,2), cluster9(:,3), 'r', '*');




    
    
