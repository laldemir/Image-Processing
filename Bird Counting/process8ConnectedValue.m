function [birdCount] = process8ConnectedValue(countBy8Connected)
    [row, col] = size(countBy8Connected);
    birdCount = 0;
    totalConnectedPixel = 0;
    for j=1: col
        pList = countBy8Connected{1,j};
        [r, c] = size(pList);
        totalConnectedPixel = totalConnectedPixel + r;
    end

    avrgConnectedPixelCount = totalConnectedPixel / col;

    count = 0;
    if(avrgConnectedPixelCount >= 100)   
        totalConnectedPixel=0;
            for j=1: col
                pList = countBy8Connected{1,j};
                [r, c] = size(pList);
                if(r > avrgConnectedPixelCount)
                    totalConnectedPixel = totalConnectedPixel + r;
                    count = count +1;
                end
            end

        isTwobird = totalConnectedPixel / count;
        istwoCount = 0;
        for j=1: col
                pList = countBy8Connected{1,j};
                [r, c] = size(pList);
                if(r > avrgConnectedPixelCount && r >= isTwobird* 2 )
                    istwoCount = istwoCount + 1;
                end
        end

        birdCount = istwoCount + count;
    else
        for j=1: col
                pList = countBy8Connected{1,j};
                [r, c] = size(pList);
                if(r >= avrgConnectedPixelCount - 5)
                    count = count +1;
                end
        end
         birdCount = count;
    end
end

