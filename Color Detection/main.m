clear all;

imageDirPath = "D:\HW3\dataset\*.jpeg";
imagePaths = dir(imageDirPath);


for i=1:length(imagePaths)
   fileName = imagePaths(i).name;
   filePath = imagePaths(i).folder + "\" + fileName;

   %% Read Input Image
    % Read orjinal image and set on orjinalImage variable
    orjinalImage = imread(filePath);

    %% Convert RGB image to HSV color space
    hsvColorImage = rgb2hsv(orjinalImage);
    hue = hsvColorImage(:, :, 1) * 360;
    s = hsvColorImage(:, :, 2) * 100;
    v = hsvColorImage(:, :, 3) * 100;

    %detect image color according to HSV values.
    %% White
    saturation = s <= 25;
    value = v >= 65;
    mergeSV = saturation.*value;
    whiteCount = sum(mergeSV,'all');
    mergeSV = mergeSV * 370;
    %ignore white kalır in hue matrix
    hue = hue + mergeSV;

    %% black
    hueBlack = hue == 0 | ( hue > 200  & hue <= 360 );
    saturation = s < 50;
    value = v < 100;
    mergeSV = saturation.*value;
    merseHSV = mergeSV.*hueBlack;
    blackCount = sum(merseHSV,'all'); 
    hue =  (merseHSV * 370) + hue;

    %% red
    hue_red = (hue >= 0 & hue <= 20) | (hue >= 341 & hue <= 360);
    redCount = sum(hue_red,'all');
    hue_red = hue_red * 371;
    hue = hue + hue_red;

    %% green
    hue_green = 71 <= hue & hue <= 160;
    greenCount = sum(hue_green,'all');

    %% yellow
    hue_yellow = 45<= hue & hue <= 70;
    yellowCount = sum(hue_yellow,'all');

    %% orange
    hue_orange = 20<= hue & hue <= 40;
    orangeCount = sum(hue_orange,'all');

    %% blue
    hue_blue = 165<= hue & hue <= 245;
    blueCount = sum(hue_blue,'all');

    %% violet
    hue_violet = 250<= hue & hue <= 320;
    violetCount = sum(hue_violet,'all');

   %% Print Results
    row  = size(hue,1);
    col = size(hue,2);
    totalCount = (row * col);

    greenPer =  (greenCount*100)/totalCount;
    whitePer =  (whiteCount*100)/totalCount;
    violetPer =  (violetCount*100)/totalCount;
    blackPer =  (blackCount*100)/totalCount;
    redPer =  (redCount*100)/totalCount;
    bluePer =  (blueCount*100)/totalCount;
    yellowPer =  (yellowCount*100)/totalCount;
    orangePer =  (orangeCount*100)/totalCount;

disp(['\n\n\n' , fileName,'\n\n\' ]);
    disp(['% ',sprintf('%04.1f', greenPer ), ' green' ]);
    disp(['% ',sprintf('%04.1f', whitePer ), ' white' ]);
    disp(['% ',sprintf('%04.1f', violetPer), ' violet' ]);
    disp(['% ',sprintf('%04.1f', blackPer ), ' black' ]);
    disp(['% ',sprintf('%04.1f', redPer ),   ' red'  ]);
    disp(['% ',sprintf('%04.1f', bluePer ),  ' blue' ]);
    disp(['% ',sprintf('%04.1f', yellowPer), ' yellow' ]);
    disp(['% ',sprintf('%04.1f', orangePer), ' orange' ]);
    disp(['% ',sprintf('%04.1f', (orangePer+yellowPer+bluePer+ redPer+blackPer+violetPer+whitePer+greenPer)), ' toplam' ]);

    figure, imshow(orjinalImage), ...
          title('orjinal image');

end







