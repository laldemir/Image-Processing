 
function blurImage = toBlurFunc(n, imageBblur)
            % n=1,  3x3 , 9
            % n=2, 5x5 , 25
            % n=3, 7x7 , 49
       
            row = size(imageBblur,1);
            column = size(imageBblur,2);
            
            paddingImage = double (zeros (row + n*2 , column + n*2));
            paddingImage(n+1 :end-n, n+1 :end-n) = imageBblur;
         
           blurImage = uint8(zeros(row, column ));
           for r=n+1 : row + n
                for c=n+1 : column + n     
                    subMatrix = paddingImage (r-n : r+n, c-n: c+n);
                    subMatrix = subMatrix / ((n + n+ 1) * ( n + n+ 1));
                    res = sum(subMatrix,'All');
                    
                    blurImage(r-n,c-n) = res;
                end
           end
end

