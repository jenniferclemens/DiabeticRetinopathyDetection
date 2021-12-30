%IP J-Component
%Diabetic Retinopathy - Hard Exudate Detection
%part-2
%Convolutional Neural Network

%%
clc 
clear all

%%

%Reading the folder of images
D='C:\Users\jenni\Documents\MATLAB\ip jcomp\patches\training'; 
imds = imageDatastore(D, 'IncludeSubfolders',true,'LabelSource','foldernames');

%%

%count the classes and no of patches in each class
labelCount = countEachLabel(imds);

%%

%specifying training and validation sets
numTrainFiles = 7500;
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles,'randomize');

%%

layers = [ ...
    imageInputLayer([32 32 1])

    %First conv1
    % 2 - size of the filter/kernel
    % 32 - number of filters/layers
    % For the convolutional layer with a default stride of 1, 'same' padding 
    % ensures that the spatial output size is the same as the input size
    
    convolution2dLayer(2,32,'Padding','same')
    batchNormalizationLayer
    reluLayer

     %conv2
    convolution2dLayer(2,32,'Padding','same')
    batchNormalizationLayer
    reluLayer
    
    %maxpool1
    %The feature map size is halved using maxpool
    %The 'Stride' name-value pair argument specifies the step size 
    % that the training function takes as it scans along the input.
    maxPooling2dLayer(2,'Stride',2)
  
    %conv3

    convolution2dLayer(2,64,'Padding','same')
    batchNormalizationLayer
    reluLayer

    %conv4

    convolution2dLayer(2,64,'Padding','same')
    batchNormalizationLayer
    reluLayer
    %maxpool2
    maxPooling2dLayer(2,'Stride',2)

    %conv5
    convolution2dLayer(2,128,'Padding','same')
    batchNormalizationLayer
    reluLayer

    %conv6
    convolution2dLayer(2,128,'Padding','same')
    batchNormalizationLayer
    reluLayer

    %maxpool3
    maxPooling2dLayer(2,'Stride',2)

    %conv7
    convolution2dLayer(2,256,'Padding','same')
    batchNormalizationLayer
    reluLayer

    %conv8
    convolution2dLayer(2,256,'Padding','same')
    batchNormalizationLayer
    reluLayer

    %fully connected layer
    %OutputSize parameter in the last fully connected layer is equal to the
    %number of classes in the target data (here 10, since 10 target data
    %has been used)

    fullyConnectedLayer(1000)
    fullyConnectedLayer(100)
    fullyConnectedLayer(2)
    softmaxLayer  %The softmax activation function normalizes the output of the fully connected layer.
    classificationLayer];

%%

    %specifying training options

    options = trainingOptions('sgdm', ...
    'InitialLearnRate',0.01, ...
    'MaxEpochs',125, ...
    'Plots','training-progress');

%%

    %train the network
    net = trainNetwork(imdsTrain,layers,options); %displays a training progress plot that shows the mini-batch loss and accuracy

%%

%train network using training data
net = trainNetwork(imdsTrain,layers,options);

%%
YPred = classify(net,imdsValidation);
YValidation = imdsValidation.Labels;

accuracy = sum(YPred == YValidation)/numel(YValidation)