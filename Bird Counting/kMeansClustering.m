function [th] = kMeansClustering(inputImage)
%KMEANCLAS Summary of this function goes here
% firstly set to initialize th value
% continue finding th until  th values same 

th = 50;
isSame = 0;
mean_f = 0;
mean_b = 0;

row = size(inputImage,1);
col = size(inputImage,2);

while(isSame < 10)
    countRb = 0;
    countRf = 0;
    totalRb = 0;
    totalRf = 0;
    for r=1 : row
        for c=1 : col     
            if inputImage(r,c) >= th    
                countRf = countRf + 1;
                totalRf = totalRf + int64(inputImage(r,c));    
            elseif inputImage(r,c) < th    
                countRb = countRb + 1;
                totalRb = totalRb + int64(inputImage(r,c));
            end
        end
    end
    mean_f = totalRf / countRf;
    mean_b = totalRb / countRb;
    newTh = (mean_f + mean_b ) / 2;
   
    if(newTh == th)
        isSame = isSame + 1;
    else
        if isSame ~= 0
        isSame = 0;
        end
        th = newTh;
    end
 end
end

