function [tempImage] = applyThValue(inputImage, th)
% appied th value to image
% forgorunc color is 1 , background color is 0

row = size(inputImage,1);
col = size(inputImage,2);

tempImage = zeros(row , col);
thMin = th - 50;
thMax = th + 50;

if( th  > 150 )
     for r=1 : row
           for c=1 : col     
               if inputImage(r,c) >= thMax
                 tempImage(r,c) = 0;
              elseif thMin <= inputImage(r,c) % &&
                 tempImage(r,c) = 1;
               else
                   tempImage(r,c) = 0;
               end
    
           end
     end 
else
     for r=1 : row
       for c=1 : col     
           if inputImage(r,c) > th
             tempImage(r,c) = 0;
          elseif thMin <= inputImage(r,c) % &&
             tempImage(r,c) = 1;
           else
               tempImage(r,c) = 1;
           end

       end
    end 
end
end

