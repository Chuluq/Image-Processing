clear all; close all; clc;

img = imread('cameraman.tif');
noisy = imnoise(img, 'salt & pepper', 0.1);
noisy = im2double(noisy);
subplot(121), imshow(noisy), title('noisy image');

% [m,n] = size(noisy);
tmp = noisy;
tmp = zeros(tmp); [m,n] = size(tmp);
% tmp = zeros(1,9); 
cnt=1; si=1;

for i = 1:m
    for j = 1:n
        cnt = 1;        
            for k1 = i-si:1+si
                for p1 = j-si:j+si
                    if ((k1>0 && p1>0) && (k1<m && p1<n))
                        tmp(1,cnt) = noisy(k1,p1);
                        cnt = cnt+1;
                    end    
                end
            end    
        %b1(i,j) = median(tmp);
        tmp = sort(tmp);
        b1(i,j) = tmp(1,5);
    end
end    

subplot(122), imshow(b1), title('median filter');