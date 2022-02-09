
%% Read Input Image
% Read orjinal image and set on orjinalImage variable
orjinalImage = imread("bird_1.jpg");

%show orjinal image 
figure, imshow(orjinalImage), ...
    title('orjinal image');

%% Gray Scale Image
% Convert to gray scale image
grayImage = toGrayI (orjinalImage);

%show gray scale image 
figure, imshow(grayImage), ...
    title('gray image');

%% K-Mean Clustering
% Find best threshold value
th = kMeansClustering(grayImage);

% Apply threshold value for select background and foreground color
appliedThImage = applyThValue(grayImage,th);

%% Connected-8 region
% count connected region by 8 
countBy8Connected = toConnectivity8(appliedThImage);

%process countBy8Connected value acording to bird size
birdCount = process8ConnectedValue(countBy8Connected);

%show temp image 
figure, imshow(appliedThImage), ...
    title(['bird count is ' num2str(birdCount)]);


