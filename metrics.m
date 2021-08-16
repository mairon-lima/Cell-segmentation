function [acc,cellAcc,cultAcc,conf,iou_cell,iou_cult]=metrics(fileNameGT,fileNamePredict) 
% Cell Segmentation metrics

img_gt=imread(fileNameGT);%Binary ground truth image
img_p=imread(fileNamePredict);%Binary prediction image

im_size=size(img_gt);   im_size1=size(img_p);
if (im_size(1,1)~=im_size1(1,1))||((im_size(1,2)~=im_size1(1,2)))
    error('Input image dimension mismatch');
end

%% Threshold
img_p_bin=(img_p>127);
img_gt_bin=(img_gt>127);

testPredictions=reshape(img_p_bin, [1 im_size(1,1)*im_size(1,2)]);
testGroundT=reshape(img_gt_bin, [1 im_size(1,1)*im_size(1,2)]);
szTest=im_size(1,1)*im_size(1,2);

% TP, TN, FP, FN for cell region

accT=0; celAcc=0; culAcc=0; numCel=0; numCul=0; 
%Measure average cell and culture accuracy
for i1=1:szTest
    if testPredictions(1,i1)==testGroundT(1,i1), accT=accT+1;    end
    if (testPredictions(1,i1)==0)&&(testGroundT(1,i1)==0), culAcc=culAcc+1; end
    if (testPredictions(1,i1)==1)&&(testGroundT(1,i1)==1), celAcc=celAcc+1; end
    if (testGroundT(1,i1)==0), numCul=numCul+1; end
    if (testGroundT(1,i1)==1), numCel=numCel+1; end
end

acc=accT/szTest;
cellAcc=celAcc/numCel;
cultAcc=culAcc/numCul;

% IoU of culture
img_gt_cul=img_gt_bin==0; img_p_cul=img_p_bin==0;
int_sec=img_gt_cul.*img_p_cul;
union=(img_gt_cul+img_p_cul)>0;
iou_cult=sum(sum(int_sec))/sum(sum(union));

% IoU of cell
img_gt_cel=img_gt_bin==1; img_p_cel=img_p_bin==1;
int_sec=img_gt_cel.*img_p_cel;
union=(img_gt_cel+img_p_cel)>0;
iou_cell=sum(sum(int_sec))/sum(sum(union));

conf = confusionmat(testGroundT',testPredictions);
for i1=1:2
conf(i1,:)=conf(i1,:)/sum(conf(i1,:));%Row normalized
end
