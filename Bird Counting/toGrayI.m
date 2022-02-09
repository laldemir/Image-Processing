
function outputImage = toGrayI(inputImage)
    if(size(inputImage,3) == 3)
        outputImage = rgb2gray(inputImage);
    else
        outputImage = inputImage;
    end
end

