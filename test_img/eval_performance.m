clear;clc;close all; format compact

vid='v001'; %Model version

for i1=1:8  % There are 8 test images
 fileNameGT=strcat(num2str(i1-1),'_gt.png');
 fileNamePredict=strcat(num2str(i1-1),'_predict_',vid,'.png');
 label=imread(fileNameGT); 
 pred=imread(fileNamePredict);
 [acc(i1),cellAcc(i1),cultAcc(i1),iou_cel(i1),iou_cul(i1),mcc(i1), ...
 prec(i1),recall(i1), dsc(i1), dc_cel(i1), dc_cul(i1)]=metrics(label,pred);
end

mAcc=mean(acc)
mcellAcc=mean(cellAcc);
mcultAcc=mean(cultAcc);

mMCC=mean(mcc)
mPrec=mean(prec)
mRecall=mean(recall)

%mConf=mean(conf_test,3)

mDc=mean(dsc);
mDcCult=mean(dc_cul);
mDSCCell=mean(dc_cel)
mIoUCell=mean(iou_cel);
mIoUCult=mean(iou_cul);


