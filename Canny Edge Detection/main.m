% Cannyd edge detection
% Prepared by Leyla Aldemir

%read image using imread function
image = imread('Cameraman.jpg');

%Convert image to gray scale
grayScaledI = toGrayI(image);

%show gray sacled image 
figure, imshow(grayScaledI), ...
    title('gray image');

%apply blurring filter to n=1(3x3)
blurringImage = toBlurFunc(1, grayScaledI);

%show image which is applied blurring filter
figure, imshow(blurringImage), ...
    title('blurring filter(3*3)');

%Apply Gradient filter and get Gmax and Gangle
[Gmax, Gangle] = toSobelGradient(blurringImage);
%show gradient magnitude image
figure, imshow(Gmax), ...
    title('Gradient Magnitude');


% apply non-maximum suppression
nonMaxImage = toNonMax(Gmax,Gangle);
figure, imshow(toConvertDoubleToUint8(toNormalizeImage(nonMaxImage))), ...
    title('nonnon-maximum suppression');

% normalize Image
nonMaxImage = toNormalizeImage(nonMaxImage);

%Appy Double Threshold
[outputI, high, low, hIndex, lIndex] =  toDoubleTh(nonMaxImage);
 figure; imshow(toConvertDoubleToUint8(outputI));
    title('Double Threshold'); 

outputI = toNormalizeImage(outputI);

% edge tracking by hysteresis
finalImage = toEdgeTrackingHysteresis(hIndex,high,lIndex, low, outputI);
figure; imshow(toConvertDoubleToUint8(finalImage));
    title('final : Edge Tracking by Hysteresis');     


function uint8Matrix = toConvertDoubleToUint8(input)   
       uint8Matrix = uint8(255*input);
end

function[o] = toNormalizeImage(m)
    v = max( m(:));
    o = m / v;
end