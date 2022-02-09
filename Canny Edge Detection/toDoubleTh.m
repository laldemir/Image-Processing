function [inputImage,strongEdges,weakEdges,strongIndex,weakIndex] = toDoubleTh(inputImage)

    rowCount = size(inputImage,1);
    columnCount = size(inputImage,2);

    highThreshold = 0.7;
    lowThreshold = 0.15;
    
    strongEdges = zeros(2, rowCount*columnCount);
    weakEdges= zeros(2, rowCount*columnCount);

    strongIndex = 1;
    weakIndex = 1;

    for i=2:rowCount-1 % row
        for j=2:columnCount-1 % col
            if(inputImage(i,j) <= highThreshold && inputImage(i,j) >= lowThreshold ) % strong edge
                inputImage(i,j) = 1;
                strongEdges(1,strongIndex) = i;
                strongEdges(2,strongIndex) = j;
                strongIndex = strongIndex + 1;
            else                            % Weak edge
                weakEdges(1,weakIndex) = i;
                weakEdges(2,weakIndex) = j;
                weakIndex = weakIndex + 1;
            end
        end
    end
end



