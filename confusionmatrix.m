%Vincent Steil
%s1008380
%returns the confusion matrix given a set of data and the corresponding
%true classifications
function [confusionmatrix] = confusionmatrix(truematrix,testmatrix)

%predicted classifiers are in the columns, true ones in the rows
%both matrices must have the same dimensions
n = length(truematrix(:,1));

confusionmatrix = zeros(3);
%here, for the predicted clusters, cluster 2=cluster 3, because they are
%swapped arround in the true_900 set
for i = 1:n
    if truematrix(i,1) == 1
        if testmatrix(i,1) == 1
            confusionmatrix(1,1) = confusionmatrix(1,1) + 1;
        elseif testmatrix(i,1) == 2
            confusionmatrix(1,2) = confusionmatrix(1,2) + 1;
        else
            confusionmatrix(1,3) = confusionmatrix(1,3) + 1;
        end
        
    elseif truematrix(i,1) == 2
        if testmatrix(i,1) == 1
            confusionmatrix(2,1) = confusionmatrix(2,1) + 1;
        elseif testmatrix(i,1) == 3
            confusionmatrix(2,2) = confusionmatrix(2,2) + 1;
        else
            confusionmatrix(2,3) = confusionmatrix(2,3) + 1;
        end
      
    else 
        if testmatrix(i,1) == 1
            confusionmatrix(3,1) = confusionmatrix(3,1) + 1;
        elseif testmatrix(i,1) == 3
            confusionmatrix(3,2) = confusionmatrix(3,2) + 1;
        else
            confusionmatrix(3,3) = confusionmatrix(3,3) + 1;
        end
    end
end
