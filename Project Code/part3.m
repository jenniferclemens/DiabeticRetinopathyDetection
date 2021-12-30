%IP J-Component
%Diabetic Retinopathy - Hard Exudate Detection
%part-3
%Visualize Convolutional Layers

%%
clc 
clear all

%%
analyzeNetwork(net)

%%
layer = 2;
name = net.Layers(layer).Name

%%
channels = 1:25;
I = deepDreamImage(net,name,channels, ...
    'PyramidLevels',1);

%%
figure
I = imtile(I,'ThumbnailSize',[64 64]);
imshow(I)
title(['Layer ',name,' Features'],'Interpreter','none')

%%
%Deeper convolutional layers

%%

layer = 26;
name = net.Layers(layer).Name

%%

channels = 1:6;
I = deepDreamImage(net,name,channels, ...
    'Verbose',false, ...
    "NumIterations",20, ...
    'PyramidLevels',2);
figure
I = imtile(I,'ThumbnailSize',[250 250]);
imshow(I)
name = net.Layers(layer).Name;
title(['Layer ',name,' Features'],'Interpreter','none')

%%
%Fully connected layers

%%
layer = 31;
name = net.Layers(layer).Name

%%
channels = [1 2];

%%
net.Layers(end).Classes(channels)

%%
I = deepDreamImage(net,name,channels, ...
    'Verbose',false, ...
    'NumIterations',100, ...
    'PyramidLevels',2);
figure
I = imtile(I,'ThumbnailSize',[250 250]);
imshow(I)
name = net.Layers(layer).Name;
title(['Layer ',name,' Features'])