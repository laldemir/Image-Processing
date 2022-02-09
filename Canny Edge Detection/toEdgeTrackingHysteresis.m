% Find low edges and connect them to hidg edge

function inputImage = toEdgeTrackingHysteresis(hIndex, high, lIndex, low, inputImage)

    for i=1:hIndex-1
        inputImage = toFindLowHigEdgeConnect(inputImage, high(2,i), high(1,i));
    end
    
    for i=1:lIndex-1
       if inputImage(low(1,i),low(2,i)) < 1
           inputImage(low(1,i),low(2,i)) = 0;
       end
    end
 
end

function inputImage = toFindLowHigEdgeConnect(inputImage, colI, rowI)
    for i = -3:1:3
        for j = -3:1:3       
            % check inndexes are range of image ?
            if (rowI+i > 0) && (colI+j > 0) && (rowI+i < size(inputImage,1)) && (colI+j < size(inputImage,2))
                if (inputImage(rowI+i,colI+j) > 0.1)
                    inputImage(rowI+i,colI+j) = 1;
                   
                end
            end
        end
    end
end