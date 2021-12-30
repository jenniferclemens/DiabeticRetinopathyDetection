%IP J-Component
%Diabetic Retinopathy - Hard Exudate Detection
%part-4
%Image Reconstruction

%%
clc 
clear all

q = imread('C:\Users\jenni\Documents\MATLAB\ip jcomp\images\A.%20Segmentation\A. Segmentation\1. Original Images\a. Training Set\IDRiD_01.jpg');
q = rgb2gray(imresize(q, [256 256]));
q = q(17:240,17:240);

%%
image = zeros(225,225);
count=1;
for j=1:225
    for k=1:225
        baseFileName = sprintf('Image_%d.png', count);
        count = count+1;
        fullFileNameHE = fullfile('C:\Users\jenni\Documents\MATLAB\ip jcomp\patches\he', baseFileName);
        fullFileNameNHE = fullfile('C:\Users\jenni\Documents\MATLAB\ip jcomp\patches\nohe', baseFileName);
        if isfile(fullFileNameHE)
             I = imread(fullFileNameHE);
        else
             I = imread(fullFileNameNHE);
        end
        image(j,k) = I(17, 17);
    end
end

pimg = mat2gray(image);
subplot(1,2,1)
imshow(pimg)
subplot(1,2,2)
imshow(q)