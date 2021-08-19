# Sub-micro scale cell segmentation using deep learning

The codes in this repository belong to the methodology in the manuscript entitled 'Sub-micro scale cell segmentation using deep learning'. We implemented various types of U-nets including training from scratch and transfer learning for cell segmentation at sub-micro scale. We distribute our codes with a GNU GPLv3 license. Codes are provided without warranty. The authors or license can not be held liable for any damages caused by the code.

train_valid*.ipynb files are the jupyter notebook files that shows the codes and results of the training and validation process. vXXX shows the version of each file. In each version, we validate performance of a specific model with different network depths, loss functions, transfer learning, and input image modalities. We used 5-fold cross-validation. The train_validation_performance_results.xlsx file shows which file version is associated with the cross-validation situation. Performance values are provided for each validation fold separately in the table columns (val_dice1, val_dice2 etc.). 

test_unet5L_cell_11jul21_v001.ipynb and test_unetXception_afmh_04jul21_v010.ipynb files are the jupyter notebook files that show the codes for testing the #1 and #10 model without training. Test results are saved to the specified folder for further evaluation. The unet_cell_seg_v001_5.hdf5 model file should be downloaded for testing. 

modelXLHzc* are the U-net model creation files that has 'X' network depth. modelUnetVGG16, modelUnetVGG19, and modelUXception are the U-net model creation files that have coefficients from the VGG16, the VGG19, and the Xception networks.

data*.py files are the data prepration files required for training, validating, and testing deep learning models. data.py is used when the input is single channel image and the method is transfer learning. data_1ch.py is used when the input image is single channel and the method is learning from scratch. data_3ch.py is used when the input image is three-channel and the method is transfer learning.

Segmentation validation and test performance evaluation codes are provided in eval_performance.m , dice_score.m , and metrics.m files.

cj_ast24h_plg_31jul11_001_nmnmv_hi is an example grayscale 512x512 pixels AFM height image (Information about file name abbreviation: c=contact mode image, j=scanner type, ast=astrocytes, 24h=culture time, plg= PLL glass, 31jul11=image capture date, 001=file number, nmnmv is the data extraction setting which are nm, nm, and volts, hi=height image). In an AFM height image, the brighter the pixel, the higher the location of that pixel. In general, cell surface pixels are higher than PLL glass pixels. cj_ast24h_plg_31jul11_001_nmnmv_label is the cell segmentation ground truth binary image (0=PLL glass surface, 1=cell surface). cj_ast24h_plg_31jul11_001_nmnmv_predict is the cell segmentation prediction binary image (0=PLL glass surface, 1=cell surface).

For more information, please refer to our journal article or contact us by sending an e-mail to corresponding author (tiryakiv@siirt.edu.tr).

Volkan Müjdat TİRYAKİ, Virginia M. AYRES, Ijaz AHMED, David I. SHREIBER.
