# Codes of sub-micro scale cell segmentation using deep learning

The codes in this repository belong to the methodology in the manuscript entitled 'Sub-micro scale cell segmentation using deep learning'. We implemented various types of U-nets including training from scratch and transfer learning for cell segmentation at sub-micro scale [1,2]. We distribute our codes with a GNU GPLv3 license. 

train_valid*.ipynb files are the jupyter notebook files that shows the codes and results of the training and validation process. vXXX shows the version of each file. In each version, we validate performance of a specific model with different network depths, loss functions, transfer learning, and input image modalities. We used 5-fold cross-validation. The train_validation_performance_results.xlsx file shows which file version is associated with the cross-validation situation. Performance values are provided for each validation fold separately in the table columns (val_dice1, val_dice2 etc.) [3-13].

modelXLHzc* are the U-net model creation files that has 'X' network depth. modelUnetVGG16, modelUnetVGG19, and modelUXception are the U-net model creation files that have coefficients from the VGG16, the VGG19, and the Xception networks [14-17].

data*.py files are the data prepration files required for training, validating, and testing deep learning models. data.py is used when the input is single channel image and the method is transfer learning. data_1ch.py is used when the input image is single channel and the method is learning from scratch. data_3ch.py is used when the input image is three-channel and the method is transfer learning.

Segmentation validation and test performance evaluation codes are provided in eval_performance.m , dice_score.m , and metrics.m files.

cj_ast24h_plg_31jul11_001_nmnmv_hi is an example grayscale 512x512 pixels AFM height image (Information about file name abbreviation: c=contact mode image, j=scanner type, ast=astrocytes, 24h=culture time, plg= PLL glass, 31jul11=image capture date, 001=file number, nmnmv is the data extraction setting which are nm, nm, and volts, hi=height image). In an AFM height image, the brighter the pixel, the higher the location of that pixel. In general, cell surface pixels are higher than PLL glass pixels. cj_ast24h_plg_31jul11_001_nmnmv_label is the cell segmentation ground truth binary image (0=PLL glass surface, 1=cell surface). cj_ast24h_plg_31jul11_001_nmnmv_predict is the cell segmentation prediction binary image (0=PLL glass surface, 1=cell surface).

# Testing instructions:
Install Python 3.6, Tensorflow, Keras, numpy, skimage, and jupyter notebook to your computer. To test the pretrained model, you do not have to have a graphic processing unit.
Here are the steps to test the pretrained model:
Download test_unet5L_cell_11jul21_v001.ipynb to your folder. 
Download eight AFM height test images (0.png … 7.png) to /test/
Download trained model file ‘unet_cell_seg_v011_5.hdf5’ to /files/. Actually, this file does not belong to the best performing model. The best performing model is U-VGG19 but the file size is larger than 400MB so we decided to put the five layer U-net model 11 which was trained from scratch using log cosh dice. You can see this model and other models' performanes in the valid_performance_results.xlsx file.
Download data_1ch and model5LHzc.py to your folder.
Open test_unet5L_lcd_1nov21.ipynb and execute the codes. The segmentation results will be saved to /test/ as a png file in less than a minute. 
To evaluate your test performance, download the ground truth images to (0_gt.png, 1_gt.png, … 7_gt.png) /test/ folder. Run the evaluation_performance.m file. You will see performance evaluation results using accuracy, precision, recall, Dice’s similarity coefficient, Matthews correlation coefficient, and confusion matrix.
If you want to test the model with your own images, make sure to rename them from 0 to n-1, where n is the number of images. 


# Training instructions:
You should have a GPU on your computer to train a model. If you have a GPU on your computer, make sure that you install everything correctly. This requires some attention. We found the following youtube video by Dr. Jeff Heaton very useful for instructions about installing Tensorflow Keras with a GPU for Windows operating systems: https://www.youtube.com/watch?v=-Q6SM_usn84  He also has installation instruction videos for other OS, so check to see his channel. Install Python 3.6, Tensorflow, Keras, numpy, skimage, and jupyter notebook to your computer. You can also train your own model on Google Colab but there are some time restrictions.
Create training and validation folders. Open train_valid_unet5L_cell_30may21_v001.ipynb with jupyter notebook. Make sure to change the folder names if needed. Lower the batch size if you get memory errors. Execute the codes. 

For more information, please refer to our manuscript or contact us by sending an e-mail to corresponding author (tiryakiv@siirt.edu.tr).

Volkan Müjdat TİRYAKİ, Virginia M. AYRES, Ijaz AHMED, David I. SHREIBER.

REFERENCES
1) Ronneberger O, Fischer P, Brox T. U-net: Convolutional networks for biomedical image segmentation. Lect. Notes Comput. Sci. (including Subser. Lect. Notes Artif. Intell. Lect. Notes Bioinformatics) 2015;9351:234–241.

2) Falk T, Mai D, Bensch R, Çiçek Ö, Abdulkadir A, Marrakchi Y, Böhm A, Deubner J, Jäckel Z, Seiwald K, Dovzhenko A, Tietz O, Bosco CD, Walsh S, Saltukoglu D, Tay TL, Prinz M, Palme K, Simons M, Diester I, Brox T, Ronneberger O. U-Net: deep learning for cell counting, detection, and morphometry. Nat. Methods 2018;16:67–70.

3) Kingma DP, Ba JL. Adam: A method for stochastic optimization. 3rd Int. Conf. Learn. Represent. ICLR 2015 - Conf. Track Proc. 2015:1–15.

4) Zhixuhao. Implementation of deep learning framework -- Unet, using Keras. 2019.

5) Ioffe S, Szegedy C. Batch normalization: Accelerating deep network training by reducing internal covariate shift. 32nd Int. Conf. Mach. Learn. ICML 2015 2015;1:448–456.

6) Maas AL, Hannun AY, Ng AY. Rectifier nonlinearities improve neural network acoustic models. Proc. 30th Int. Conf. Mach. Learn. 2013;30.

7) Srivastava N, Hinton GE, Krizhevsky A, Salakhutdinov I, Salakhutdinov R. Dropout: A Simple Way to Prevent Neural Networks from Overfittin. J. Mach. Learn. Res. 2014;15:1929–1958.

8) HZCTony. Unet : multiple classification using Keras. github 2019.

9) Yi-de M, Qing L, Zhi-bai Q. Automated Image Segmentation Using Improved PCNN Model Based on Cross-Entropy. In: Proc. 2004 Int. Symp. Intell. Multimedia, Video Speech Process. Hong Kong: IEEE; 2004. p 743–746.

10) Sudre CH, Li W, Vercauteren T, Ourselin S, Jorge Cardoso M. Generalised dice overlap as a deep learning loss function for highly unbalanced segmentations. Lect. Notes Comput. Sci. 2017:240–248.

11) Salehi SSM, Erdogmus D, Gholipour A. Tversky loss function for image segmentation using 3D fully convolutional deep networks. Lect. Notes Comput. Sci. 2017:379–387.

12) Abraham N, Khan NM. A novel focal tversky loss function with improved attention u-net for lesion segmentation. Proc. - Int. Symp. Biomed. Imaging 2019;2019-April:683–687.

13) Jadon S. A survey of loss functions for semantic segmentation. In: 2020 IEEE Conf. Comput. Intell. Bioinforma. Comput. Biol. CIBCB 2020. Via del Mar, Chile; 2020. p 1–7.

14) Simonyan K, Zisserman A. Very deep convolutional networks for large-scale image recognition. In: 3rd Int. Conf. Learn. Represent. ICLR 2015 - Conf. Track Proc. 2015. p 1–14.

15) Chollet F. Xception: Deep learning with depthwise separable convolutions. Proc. - 30th IEEE Conf. Comput. Vis. Pattern Recognition, CVPR 2017 2017;2017-Janua:1800–1807.

16) Tomar N. Semantic-Segmentation-Architecture. github 2021.

17) Siddhartha. Unet Xception Keras for Pneumothorax Segmentation. Kaggle 2019.
