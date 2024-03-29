function cM = confussionMatrix(Xtrain, ytrain, Xtest, ytest, option)
    %this function will return the confussion matrix of classification
    %option = 1, will use prototype classification
    %option = 2, will use knn classification
    
    %initiate all element in confussion matrix with 0-value
    cM = zeros(10);
        
    if option==1, 
        %calculate the prototype of each class
        p = createPrototype(Xtrain, ytrain);
        
        %generate confussion matrix based on 10 class [0,9]
        for i=1:length(Xtest(:,1))
            predicted = prototypeClassification(Xtest(i,:), p);
            cM(ytest(i)+1, predicted+1) = cM(ytest(i)+1, predicted+1) + 1;
        end
    elseif option==2,
        
        for i=1:length(Xtest(:,1))
            predicted = nnClassification(Xtest(i,:), Xtrain, ytrain);
            cM(ytest(i)+1, predicted+1) = cM(ytest(i)+1, predicted+1) + 1;
        end
    end