clear all; close all; clc;

img = imread('cameraman.tif');
noisy = imnoise(img, 'salt & pepper', 0.1);
noisy = im2double(noisy);
subplot(121), imshow(noisy), title('noisy image');

[m,n] = size(noisy);
si=1; Q=0;
for i = 1:m
    for j = 1:n
        con=0; s1=0; s2=0;
        for k1 = i-si:i+si
            for p1 = j-si:j+si
                if ((k1>0 && p1>0) && (k1<m && p1<n))
                    con = con+1;
                    s1 = s1+(noisy(k1,p1)^Q);
                    s2 = s2+(noisy(k1,p1)^(Q+1));
                end    
            end    
        end
        b1(i,j) = s2/s1;
    end
end    

subplot(122), imshow(b1), title('Contraharmonic mean filtered');