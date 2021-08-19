# Sub-micro scale cell segmentation using deep learning

The codes in this repository shows how we implemented various types of U-nets including training from scratch and transfer learning for cell segmentation at sub-micro scale. We distribute our codes with a GNU GPLv3 license. Codes are provided without warranty. The authors or license can not be held liable for any damages caused by the code.

modelXLHzc are the U-net model files that has 'X' network depth. modelUnetVGG16 is the U-net model file that has coefficients from the VGG16 network. modelUnetVGG19 is the U-net model file that has coefficients from the VGG19 network. modelUXception is the U-net model file that has coefficients from the Xception network.

data*.py files are the data prepration files required for training, validating and testing deep learning models.

train_valid*.ipynb files are the jupyter notebook files that shows the results of the training and validation process. vXXX shows the version of each file. In each version, we test performance of a specific model with a loss function and input image. See the train_validation_performance_results.xlsx file to see which file version is associated with the training&validation situation.

test_unet5L_cell_11jul21_v001.ipynb and test_unetXception_afmh_04jul21_v010.ipynb files are the jupyter notebook files that show the codes for testing the #1 and #10 model without training. Test results are saved to the specified folder for further evaluation. The unet_cell_seg_v001_5.hdf5 model file should be downloaded for testing. 
 
Model performance evaluation codes are provided in eval_performance.m , dice_score.m , and metrics.m files.

cj_ast24h_plg_31jul11_001_nmnmv_hi is an example 8-bit grayscale AFM height image. (c=contact mode image, j=scanner type, ast=astrocytes, 24h=culture time, plg= PLL glass, 31jul11=image capture date, 001=file number, nmnmv is the data extraction setting which are nm, nm, and volts, hi=height image.) The brighter the pixel, the higher the location of that pixel. In general, cell surface pixels are higher than PLL glass pixels. cj_ast24h_plg_31jul11_001_nmnmv_label is the cell segmentation ground truth binary image (0=PLL glass surface, 1=cell surface). cj_ast24h_plg_31jul11_001_nmnmv_predict is the cell segmentation prediction binary image (0=PLL glass surface, 1=cell surface).

For more information, please refer to our journal article.

Volkan Müjdat TİRYAKİ, Virginia M. AYRES, Ijaz AHMED, David I. SHREIBER.
