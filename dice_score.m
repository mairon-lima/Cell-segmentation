function [dsc, dc_cult, dc_cell] = dice_score(fileNameGT,fileNamePredict)
% Dice score calculation of two-binary image

%fileNameGT='0_ground_truth.png';
%fileNamePredict='0_predict_stc_v01.png';

img_gt=imread(fileNameGT);%Binary ground truth image
img_p=imread(fileNamePredict);%Binary prediction image

im_size=size(img_gt);

% 0  culture
% 1  cell

%% Threshold
img_p_bin=(img_p>127);
img_gt_bin=(img_gt>127);

% 0  culture
% 1  cell

pred_vec=reshape(img_p_bin, [1 im_size(1,1)*im_size(1,2)]);
gt_vec=reshape(img_gt_bin, [1 im_size(1,1)*im_size(1,2)]);

% Dice coefficient of foreground tissues and background alltogether
intersection=pred_vec==gt_vec;
sum_int=sum(intersection);
sum_gt_class=sum((gt_vec==0)|(gt_vec==1));
sum_pred_class=sum((pred_vec==0)|(pred_vec==1));
dsc=2*sum_int/(sum_gt_class+sum_pred_class);

% dc_cul 
intersection=(pred_vec==gt_vec)&(gt_vec==0);
sum_int=sum(intersection);
sum_gt_class=sum(gt_vec==0);
sum_pred_class=sum(pred_vec==0);
dc_cult=2*sum_int/(sum_gt_class+sum_pred_class);

%dc_cel
intersection=(pred_vec==gt_vec)&(gt_vec==1);
sum_int=sum(intersection);
sum_gt_class=sum(gt_vec==1);
sum_pred_class=sum(pred_vec==1);
dc_cell=2*sum_int/(sum_gt_class+sum_pred_class);

end