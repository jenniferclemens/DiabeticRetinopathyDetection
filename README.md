# DiabeticRetinopathyDetection

Dataset : https://www.kaggle.com/aaryapatel98/indian-diabetic-retinopathy-image-dataset

Training image dataset contains 10,000 image patches of size 32x32 containing hard exudates at location (17,17) and 10,000 similar image patches that don't have hard exudates at location (17,17).

The convolutional neural network uses 8 convolutional layers, each using a kernel of size 2x2. After each convolution layer, batch normalization and ReLU layers are used. After every 2 layers, maxpooling is used to half the feature map. Finally, three fully connected layers are used to classify the image patches as either containing hard exudates or not.

The network was trained for 125 epochs. Each epoch consisted of 117 iterations.

The accuracy of the network was found to be 0.9974.

## File explanation
### part1.m
This file contains the code used to generate the patches and save them in separate folders to classify them according to the ground truth images.

### part2.m
This file contains the code used to train and evaluate the convolutional neural network.

### part1.m
This file contains the code used to visualize the convolution layers.

Reference: 
[Benzamin, Avula, and Chandan Chakraborty. "Detection of hard exudates in retinal fundus images using deep learning." 2018 Joint 7th International Conference on Informatics, Electronics & Vision (ICIEV) and 2018 2nd International Conference on Imaging, Vision & Pattern Recognition (icIVPR). IEEE, 2018.](https://arxiv.org/ftp/arxiv/papers/1808/1808.03656.pdf)

