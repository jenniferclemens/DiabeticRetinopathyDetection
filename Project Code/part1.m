%IP J-Component
%Diabetic Retinopathy - Hard Exudate Detection
%part-1
%classifying each pixel

%%
clc 
clear all

%%

%Reading the folder of images
D='C:\Users\jenni\Documents\MATLAB\ip jcomp\images\A.%20Segmentation\A. Segmentation\2. All Segmentation Groundtruths\a. Training Set\3. Hard Exudates'; 
S=dir(fullfile(D,'*.tif'));  
D1='C:\Users\jenni\Documents\MATLAB\ip jcomp\images\A.%20Segmentation\A. Segmentation\1. Original Images\a. Training Set'; 
S1=dir(fullfile(D1,'*.jpg')); 

%%

%saving the classified image patches
count = 1;
for k = 1:numel(S)
    
    F = fullfile(D,S(k).name); 
    I = imread(F); 
    I = imresize(I, [256 256]);
    F1 = fullfile(D1,S1(k).name); 
    I1 = imread(F1); 
    I1 = imresize(I1, [256 256]);
    
    %image patch generation
    patchSz = [32 32];
    patches = cell(225,225);
    for i = 1:225
        Isub = I(i:i+31,:);
        Isub1 = I1(i:i+31,:);
        for j = 1:225
            patches{i,j} = Isub(:,j:j+31);
            patches1{i,j} = Isub1(:,j:j+31);
            p = patches{i,j};
            pimg = mat2gray(patches1{i,j});
            baseFileName = sprintf('Image_%d.png', count);
            if p(17,17)==1
                fullFileName = fullfile('C:\Users\jenni\Documents\MATLAB\ip jcomp\patches\he', baseFileName);
            else
                fullFileName = fullfile('C:\Users\jenni\Documents\MATLAB\ip jcomp\patches\nohe', baseFileName);
            end
            imwrite(pimg, fullFileName);
            count = count + 1;
        end
    end
    
end
