% for gradient using the sobel operator
function [gradientImage, angleM] = toSobelGradient(imageBgradient)
            n = 1;
            Sx = [-1 0 1 ; -2 0 2 ; -1 0 1]/2;
            Sy = [1 2 1 ; 0 0 0; -1 -2 -1]/2;

            row = size(imageBgradient,1);
            column = size(imageBgradient,2);
            
           %add padding righ to left one, top to bottom one
           paddingImage = double (zeros (row + n*2 , column + n*2));
           paddingImage(n+1 :end-n, n+1 :end-n) = imageBgradient;
           gradientImage = uint8(zeros(row, column ));
           angleM = int8(zeros(row, column ));

           for r=n+1 : row + n
                for c=n+1 : column + n   

                    subMatrix = paddingImage (r-n : r+n, c-n: c+n);

                    Gy = subMatrix(1,1) * Sy(1,1) + ...
                         subMatrix(1,2)  * Sy(1,2) + ...
                         subMatrix(1,3)  * Sy(1,3) + ...
                         subMatrix(3,1)  * Sy(3,1) + ...
                         subMatrix(3,2)  * Sy(3,2) + ...
                         subMatrix(3,3)  * Sy(3,3);

                    Gx = subMatrix(1,1) * Sx(1,1) + ...
                         subMatrix(2,1) * Sx(2,1) + ...
                         subMatrix(3,1) * Sx(3,1) + ...
                         subMatrix(1,3) * Sx(1,3) + ...
                         subMatrix(2,3) * Sx(2,3) + ...
                         subMatrix(3,3) * Sx(3,3);

                    gradientImage(r-n,c-n) = sqrt(Gx.^2 + Gy.^2);
                    angleM(r-n,c-n) = atan2(Gy,Gx);

                end
           end
end 

