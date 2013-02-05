%computes the distance matrix for matrix data_90
%Vincent Steil 
%s1008380

function twoto

%calculate the distance matrix to find the first two means
distmatrix = zeros(90,90);
load('data_90');

for i = 1:1:90
    for j = 1:1:90
         
       xdist = data_90(i,1) - data_90(j,1);
       ydist = data_90(i,2) - data_90(j,2);
       zdist = data_90(i,3) - data_90(j,3);
       distmatrix(i,j) = sqrt((xdist)^2 + (ydist)^2 + (zdist)^2);
       
    end
end


[v1,index1]=max(distmatrix);
[v2,index2]=max(max(distmatrix));

idistmatrix = index1(index2);
jdistmatrix = index2;

mean1 = data_90(idistmatrix,:);
mean2 = data_90(jdistmatrix,:);

%start clustering



while 1==1
   
    cluster1 = zeros(0,3);
    cluster2 = zeros(0,3);
    for i = 1:1:90
        mean1dist = sqrt((mean1(1)-data_90(i,1))^2 + (mean1(2)-data_90(i,2))^2 + (mean1(3)-data_90(i,3))^2);
        mean2dist = sqrt((mean2(1)-data_90(i,1))^2 + (mean2(2)-data_90(i,2))^2 + (mean1(3)-data_90(i,3))^2);
        if mean1dist >= mean2dist
            cluster2 = [cluster2; data_90(i,:)]
        else
            cluster1 = [cluster1; data_90(i,:)]
        end
    end
    
   if (mean1 == mean(cluster1)) & (mean2 == mean(cluster2))
       break;
   end
   
   mean1 = mean(cluster1)
   mean2 = mean(cluster2)
    
end

