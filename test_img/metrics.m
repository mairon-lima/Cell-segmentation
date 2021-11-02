function [acc,cellAcc,cultAcc,iou_cell,iou_cult,mcc,prec,recall,dsc, dc_cult, dc_cell]=metrics(label,pred) 
% Cell Segmentation metrics

%label=imread(fileNameGT);%Binary ground truth image
%pred=imread(fileNamePredict);%Binary prediction image

im_size=size(label);   im_size1=size(pred);
if (im_size(1,1)~=im_size1(1,1))||((im_size(1,2)~=im_size1(1,2)))
    error('Input image dimension mismatch');
end

%% Threshold
pred_bin=(pred>127);
label_bin=(label>0);

testPredictions=reshape(pred_bin, [1 im_size(1,1)*im_size(1,2)]);
testGroundT=reshape(label_bin, [1 im_size(1,1)*im_size(1,2)]);
szTest=im_size(1,1)*im_size(1,2);

% TP, TN, FP, FN for cell region

accT=0; celAcc=0; culAcc=0; numCel=0; numCul=0; 
tp=0; fp=0; tn=0; fn=0;
%Measure average cell and culture accuracy
for i1=1:szTest
    if testPredictions(1,i1)==testGroundT(1,i1), accT=accT+1;    end
    if (testPredictions(1,i1)==0)&&(testGroundT(1,i1)==0), culAcc=culAcc+1; end
    if (testPredictions(1,i1)==1)&&(testGroundT(1,i1)==1), celAcc=celAcc+1; end
    if (testGroundT(1,i1)==0), numCul=numCul+1; end
    if (testGroundT(1,i1)==1), numCel=numCel+1; end
    
    if (testGroundT(i1)==1)&&(testPredictions(i1)==1), tp=tp+1; end %true positive
    if (testGroundT(i1)==0)&&(testPredictions(i1)==1), fp=fp+1; end %false positive
    if (testGroundT(i1)==0)&&(testPredictions(i1)==0), tn=tn+1; end %true negative
    if (testGroundT(i1)==1)&&(testPredictions(i1)==0), fn=fn+1; end %false negative
end

acc=accT/szTest;
cellAcc=celAcc/numCel;
cultAcc=culAcc/numCul;

% IoU of culture
img_gt_cul=label_bin==0; img_p_cul=pred_bin==0;
int_sec=img_gt_cul.*img_p_cul;
union=(img_gt_cul+img_p_cul)>0;
iou_cult=sum(sum(int_sec))/sum(sum(union));

% IoU of cell
img_gt_cel=label_bin==1; img_p_cel=pred_bin==1;
int_sec=img_gt_cel.*img_p_cel;
union=(img_gt_cel+img_p_cel)>0;
iou_cell=sum(sum(int_sec))/sum(sum(union));

%conf = confusionmat(testGroundT',testPredictions);
%for i1=1:2
%conf(i1,:)=conf(i1,:)/sum(conf(i1,:));%Row normalized
%end

% Calculate The Matthews correlation coefficient (MCC) or phi coefficient 
mcc=(tp*tn-fp*fn)/(sqrt((tp+fp)*(tp+fn)*(tn+fp)*(tn+fn)));
%Precision
prec=tp/(tp+fp);
%Recall
recall=tp/(tp+fn);

% Dice scores

% 0  culture
% 1  cell

pred_vec=reshape(pred_bin, [1 im_size(1,1)*im_size(1,2)]);
gt_vec=reshape(label_bin, [1 im_size(1,1)*im_size(1,2)]);

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

