clear all; close all; clc;

img = imread('circuit.png');
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);
R_img = img*0;
G_img = img*0;
B_img = img*0;
img = ((R/3)+(G/3)+(B/3));
size_img = size(img);

gs = imnoise(img, 'gaussian',0,0.002);
denoise_arith = gs;
denoise_geo = gs;

%denoise arith mean
for i=2:size_img-1
    for j=2:size_img-1
        sum = 0;
        for x = i-1:i+1
            for y = j-1:j+1
                sum = sum + double(gs(x,y));
            end
        end
        result = sum/9;
        denoise_arith(x,y) = result;
    end
end

%denoise geo mean
for i=2:size_img-1
    for j=2:size_img-1
        sum = 1;
        for x = i-1:i+1
            for y = j-1:j+1
                sum = sum * double(gs(x,y));
            end
        end
        result = sum.^(1/9);
        denoise_geo(x,y) = result;
    end
end

figure
subplot(2,2,1),imshow(img),title('Original');
subplot(2,2,2),imshow(gs),title('Gaussian');
subplot(2,2,3),imshow(denoise_arith),title('Arith Mean');
subplot(2,2,4),imshow(denoise_geo),title('Geo Mean');